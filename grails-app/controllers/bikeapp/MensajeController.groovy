package bikeapp

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
class MensajeController {

   def sesionService
   def amistadService

   def index(){
      def usuario = sesionService.usuarioEnSesion()  	//Obtenemos el usuario para buscar mensajes que corresponde.
      [usuario:usuario, conversaciones: ConvU.findAllByU1OrU2(usuario,usuario),amigos: amistadService.Amigos(usuario),usuarios: Usuario.list()]		//El controlador envía al cliente un parametro con los mensajes que encuentre en la BD para el usuario en sesion.
   }

	//Se utiliza para buscar los mensajes asociados a una conversacion entre 2 usuarios.
   def buscarMensajes(){
      def userName = params.userName		//Recibo el userName
      def mensajes = []
      def usuario1 = sesionService.usuarioEnSesion()	//Encuentro el usuario logueado
      def usuario2 = Usuario.findByUsername(userName)		//Encuentro el usuario con ese username
      def conversacion2 = ConvU.findByU1AndU2(usuario1,usuario2)
      def conversacion3 = ConvU.findByU1AndU2(usuario2,usuario1)
      //Tengo que revisar ambas posibilidades en la base de datos. (u1,u2 y u2,u1). Ambas son la misma conversacion, por eso debo hacer 2 busquedas.
      //Si todo funciona bien, en el momento de crear conversaciones no deja hacer duplicados (a,b) y (b,a). Solo puede existir una : (a,b)  ó  (b,a)
      if (conversacion2 != null){
      	mensajes = Mensaje.findAllByConversacion(conversacion2)	//Encuentro mensajes asociados a esa conversacion
      }
      else if (conversacion3 != null){
      	mensajes = Mensaje.findAllByConversacion(conversacion3)	//Encuentro mensajes asociados a esa conversacion
      }
      else{
      	mensajes = null
      }
      JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render mensajes as JSON			//devuelvo mensajes a javascript
      	}
   }

   //Funcion que se encarga de buscar las conversaciones asociadas a un usuario en la base de datos.
   def buscarConversaciones(usr1,usr2){
   		def usuario = usr
   		def s1 = ConvU.findByU1OrU2(usr1,usr1)
   		if (s1 != null){
   			return 'No existen conversaciones para el usuario'
   		}
   		else{
   			def conversacion = new ConvU(u1:usr1,u2:usr2)		//Creo una nueva conversacion con ambos usuarios
      		conversacion.save(flush:true)		//Almaceno
      	}


   }


   def crearMensaje(){
   	  def userName = params.userName			//Obtengo el parametro nombre para buscar el usuario.
      println(userName)
      def usuario1 = sesionService.usuarioEnSesion()		//encuentro el usuario logueado
      println(usuario1)
      def usuario2 = Usuario.findByUsername(userName)			//Encuentro el usuario destino
      println(usuario2)
      def conversacion1 = ConvU.findByU1AndU2(usuario1,usuario2)			//Encuentro la conversacion actual
      def conversacion2 = ConvU.findByU1AndU2(usuario2,usuario1)
      def mensaje
      if (conversacion1 == null){
        mensaje = new Mensaje(fecha:new Date(),conversacion:conversacion2,dueño:usuario1,contenido:params.contenido)		//Creo el nuevo mensaje
        println(conversacion2)
      }
      else{
        mensaje = new Mensaje(fecha:new Date(),conversacion:conversacion1,dueño:usuario1,contenido:params.contenido)		//Creo el nuevo mensaje
        println(conversacion1)
      }
      mensaje.save(flush:true)
      println(mensaje)
      render mensaje.contenido
   }


   def crearConversacion(){
      def usuario1 = sesionService.usuarioEnSesion()		//Usuario creador de la conversacio
      def userName = params.userName				//Nombre de usuario del destinatario
      def usuario2 = Usuario.findByUsername(userName)			//Usuario del destinatario en la base de datos
      def conv1 = ConvU.findByU1AndU2(usuario1,usuario2)
      def conv2 = ConvU.findByU1AndU2(usuario2,usuario1)	//Hago 2 busquedas ya que necesito buscar conversaciones con ambas posiblidades de usuarios.
      //retorna la conversacion que encuentre (conv1 o conv2). retorna conversacion si es una nueva porque no encuentra ninguna.
      if (conv1 != null){
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conv1 as JSON
      	}
      }
      else if (conv2 != null){
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conv2 as JSON
      	}
      }
      else if (conv1 == null && conv2 == null){
      	def conversacion = new ConvU(u1:usuario1,u2:usuario2)		//Creo una nueva conversacion con ambos usuarios
      	conversacion.save(flush:true)		//Almaceno la nueva conversacion
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conversacion as JSON
      	}
      }
   }
}
