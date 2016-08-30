package bikeapp
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
class GrupoController {

   def sesionService

   def index() {
      //falta aplicar el filtro para traer solo los grupos del usuario
      def usuario = sesionService.usuarioEnSesion()
      def grupos = UsuarioGrupo.findAllByUsuario(usuario).collect{ it.grupo }
      render(view:"grupos",model:[grupos:grupos])
   }

   def create(){
      respond new Grupo(params)
   }


   //EN ESTA SE GUARDA LA INFORMACIÓN INICIAL DEL GRUPO, ADIONAL SE TIENE QUE EL ADMINISTRADOR SE REGISTRA DOS VECES, ESTO SE PUEDE
   //REDUCIR, EN LA SIGUIENTE TAREA LO VOY A PENSAR
   def save(Grupo grupoInstance){
      if( grupoInstance == null){
         return response.sendError(500)
      }
      def usuario = sesionService.usuarioEnSesion()
      grupoInstance.administrador = usuario
      def tags = params["tags"].tokenize(",")
      tags = tags.collect{ it.trim() }
      tags = tags.findAll{ it != ""}
      //tags.each{ print it }
      grupoInstance.tags = tags
      grupoInstance.save flush:true,failOnError:true
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupoInstance)
      usuario_grupo.save flush:true,failOnError:true
      redirect(action:"index")  
   }


   //MUESTRA LOS GRUPOS CONSULTANDO APROPIADAMENTE LAS CLASES, FIJARSE EN COMO ENTRA LA TABLA INTERMEDIA EN LAS CONSULTAS
   def obtenerGrupo(String id){
      def usuario = sesionService.usuarioEnSesion()
      def grupo = Grupo.findById(id)
      def miembros = UsuarioGrupo.findAllByGrupo(grupo)
      def miembro = miembros.every{ it.usuario != usuario}
      render(template:"grupo",model:[grupo:grupo,miembros:miembros,miembro:miembro])
   }

   //PERMITE UNIRSE A UN GRUPO, ESTO SIMPLEMENTE SE HACE AGREGANDO UN REGISTRO EN LA TABLA INTERMEDIA
   def unirme(String id){
      def usuario = sesionService.usuarioEnSesion()
      def grupo = Grupo.findById(id)
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupo)
      usuario_grupo.save flush:true,failOnError:true
      def miembros = UsuarioGrupo.findAllByGrupo(grupo)
      def miembro = miembros.every{ it.usuario != usuario}
      render(template:"union",model:[grupo:grupo,miembros:miembros,miembro:miembro])
      //redirect(action:"index")
   }

   //NO SE ESTA GUARDANDO EN LA DB
   def crearAporte(String id,String contenido){
      def grupo = Grupo.findById(id)
      def usuario = sesionService.usuarioEnSesion()      
      def aporte= new Aporte()
      aporte.contenido = contenido
      aporte.usuario = usuario
      aporte.grupo = grupo
      //print "OK"
      aporte.save flush:true, failOnError:true
      //render comentarios
      //print "OK"
      render(template:"aporte", model:[grupo:grupo])
   }

   def actualizarComentarios(){
      def inx = params['grupoActual']
      def grupo = Grupo.findById(inx)
      //render comentarios
      render(template:"aporte", model:[grupo:grupo])

   }
   
   def buscarGrupos(String tg){
      def grupos = []
      if( tg != "" ){
         def tgs = tg.tokenize(",")
         tgs = tgs.collect{ it.trim() }
         tgs = tgs.findAll{ it != ""}
         //print tgs
         //tags.each{ print it }
         grupos = Grupo.findAll()
         if( ! tgs.any{ it == "*"}){
            grupos = grupos.findAll{ it.tags.any{ tgs.contains(it) } } 
         }
         //print grupos
      }else{
         def usuario = sesionService.usuarioEnSesion()
         grupos = UsuarioGrupo.findAllByUsuario(usuario).collect{ it.grupo }
      }
      print grupos
      print tg
      render(template:"listaGrupos",model:[grupos:grupos])
   }
}
