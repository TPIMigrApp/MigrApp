package bikeapp
import grails.plugin.springsecurity.annotation.Secured;


//CON SPRING SE PUEDEN HACER ANOTACIONES, LAS CUALES VAN A MANEJAR DE FORMA AUTOMATICA EL ACCESO A RECURSOS
//HAY 4 TIPOS PARA HACER ESTO, LAS ANOTACIONES SON LAS MÁS FACILES DE USAR, FIJARSE EN QUE CON LA SIGUIENTE ANOTACION LO QUE LE DIGO
//A SPRING ES QUE ESTE RECURSO PUEDE SER USADO O ACCEDIDO POR EL ROL DE USUARIO, LOS ROLES LOS CARGO DE FORMA DINAMICA EN LA BASE DE DATOS
//AL INICIAR LA APLICACION 'run-app' PARA VER LA CARGA PUEDEN VER EL ARCHIVO BootStrap.groovy EN conf
//OTRA OBSERVACION IMPORTANTE ES QUE ESTAS ANOTACIONES SE PUEDEN TRABAJAR A NIVEL DE CLASE O A NIVEL DE METODO, COMO SE DESEE
@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
class FotoController {

   //AQUI SE DA USO AL SERVICIO, ESTO SE HACE FORMA AUTOMATICA POR MEDIO DE INYECCION DE DEPENDENCIAS, VER EL CURSO DE SOFTWARE 1
   //SI NO TIENEN NI IDEA
   //GRAILS NOS INYECTA LA DEPENDENCIA EN LA VARIABLE SIGUIENTE, SE HACE EL ENLACE DE FORMA AUTOMATICA
   def sesionService
   //metodo index, es el encargado de llamar a la vista para mostrar el "album de fotos", para ello
   //primero se tienen que reunir las fotos, eso lo hago en el metodo list()
  def index(Integer max) {
      params.max = Math.min(max ?: 10, 100)
      //respond Foto.list(params), model:[FotoInstanceCount: Foto.count()]
      list()
    }

   //create de crear una nueva foto
   def create(){
      respond new Foto(params)
   }

   //Save nos permite guardar la foto en la base de datos, primero se valida que tengamos una instancia valida
   //donde guardar la foto, luego se captura la foto que el usuario selecciono, y posteriormente se convierte en un arreglo de bytes
   //antes de guardar capturo la sesion actual del usuario que esta activa y guardo, al final me dirigo a la pagina principal, es decir
   //a la que tiene el album de fotos, este metodo es invocado por la vista de create
   def save(Foto instancia){
      if( instancia == null){
         return response.sendError(500)
      }
      def uploadedFile = request.getFile('selector')
      instancia.imagen = uploadedFile.getBytes()
      //UNA VEZ SE INYECTA LA DEPENDENCIA PUEDO DAR DE ELLA, NOTAR COMO SE SIMPLIFICA LA OBTENCION DEL USUARIO EN SESION ACTIVA
      if( params["ubicacion"] ){
         PuntoInteres pnt = new PuntoInteres()
         pnt.lat = Double.parseDouble(params["lat"])
         pnt.lng = Double.parseDouble(params["lng"])
         pnt.usuario = sesionService.usuarioEnSesion()
         pnt.tipo = "PUNTO_IMAGEN"
         pnt.save flush:true,failOnError:true
         instancia.puntoImagen = pnt
      }
      instancia.usuario = sesionService.usuarioEnSesion()
      instancia.save flush:true,failOnError:true
      redirect(action: "index")
   }

   /**Esta función es llamada por el .gsp que pinta las fotos, transoforma de un arreglo de byte a una foto visible*/
   def pintarImagen(Foto instancia){
      response.outputStream << instancia.imagen
      response.outputStream.flush()
   }

   /*
   *Filtra las imagenes de acuerdo al usuario que se encuentre en sesión
   */
   def list(){
      def imagenes = Foto.findAllByUsuario(sesionService.usuarioEnSesion())
      [imagenes:imagenes]
   }

   /**
   * este metodo es el encargado de mostrar una foto en particular, para ello desde la vista se captura el id de la imagen,
   * y se pasa al modelo de esta vista, show, la imagen actual así como su indice, es una bobada redundante pero pues que se le hace
   */
   def show(){
      def inx = params['imagenactual']
      def img = Foto.findById(inx)
      def comentarios = Comentario.findAllByFoto(img)
      //render comentarios
      render(view:"show", model:[imagencapturada: img, inx : inx,comentarios:comentarios] )
   }


   /*
   * METODO ACTUALIZAR COMENTARIOS, SE ENCARGA DE VOLVER A LEER LOS COMENTARIOS DE LA FOTO Y LOS ENVIA AL TEMPLATE
   * NOTAR LA DIFERENCIA ENTRE EL redirect DEL METODO show Y EL DE ESTE METODO, AHORA APUNTO AL TEMPLATE DE comentarios
   * ES IMPORTANTE LEER SOBRE ESTA CARACTERISTICA QUE TIENE GRAILS Y ENTENDER COMO ES QUE FUNCIONA
   */
   def actualizarComentarios(){

      def inx = params['imagenactual']
      def img = Foto.findById(inx)
      def comentarios = Comentario.findAllByFoto(img)
      //render comentarios
      render(template:"comentario", model:[comentarios:comentarios])

   }

   def fotosUsuario(String username){
      def usuario = Usuario.findByUsername(username)
      def imagenes = Foto.findAllByUsuario(Usuario.findByUsername(username))
      [imagenes:imagenes,username:username,usuario:usuario]
   }

}
