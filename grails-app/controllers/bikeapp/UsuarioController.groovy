package bikeapp

//LO TUVE QUE BORRAR TODO, NO SE QUE ESTABA GENERANDO CONFLICTO Y ME DIO PEREZA PONER A MIRAR UNO POR UNO, LO CIERTO ES QUE EL LOGIN
//Y EL LOGOUT LO VA A MANEJAR SPRING DE AHORA EN ADELANTE, SERIA RE ESCRIBIR EL REGISTRO, SIN EMBARGO ES SOLO AJUSTAR PARA QUE LO HAGA.:

import java.security.SecureRandom

//EN ESTA CLASE PROCURAR NO PONER NADA DADO QUE ES UN CONTROLADOR QUE ES DE TIPO PUBLICO
class UsuarioController {

   def sesionService

   def index(){
      redirect(uri:"/")
   }

   def registro() {
      def user = new Usuario(params)
      user.secret = new BigInteger(200,new SecureRandom()).toString();
      user.enabled = false
      user.save flush:true,failOnError: true
      def roleUser = SecRole.findByAuthority('ROLE_USUARIO')
      SecUsuarioSecRole.create user,roleUser,true
      [username:user.username]
   }

   def intereses(){
      def user= Usuario.findByUsername(params['username']) 
      String s="['"
      for(item in params.interes){
         s+=item
         s+="','"
      }
      s=s.substring(0,s.length()-2)
      s+="]"
      user.interes=s
      user.save flush:true,failOnError:true
      redirect(action:'mensaje',params:[username:user.username])
   }

   def mensaje(){
      def user = Usuario.findByUsername(params["username"])
      def message = "Hola "+user.nombre+", \n\n\n\n"+
         "Gracias por registrarse en BikeApp!! \n\n"+
         "Para validar tu cuenta por favor haz click sobre el siguiente enlace:\n\n"+
         "http://localhost:8080/WebBike/usuario/confirmar?username="+user.username+"&secret="+user.secret+"\n"+
         "Saludos, BikeApp Team!!"
      sendMail {
         async true
         to user.email
         cc "bikeappteam@gmail.com"
         subject "Validación de Cuenta - BikeApp"
         body  message
      }
      def msj = "Registro exitoso, a tu correo ha sido enviado un mensaje para validar tu cuenta, debes validarla para poder iniciar sesión."
      render(view:"satisfactorio",model:[msj:msj])
   }

   def reenviar(){
      def user = Usuario.findByUsername(params["usuario"])
      //user.secret = new BigInteger(200,new SecureRandom()).toString();
      //user.save flush:true,failOnError:true
      if( user == null ){
         def msj = "El usuario no existe!!"
         render(view:"satisfactorio",model:[msj:msj])
         return
      }
      redirect(action:'mensaje',params:[username:user.username])
   }

   def test(){
           /*sendMail {
         async true
         to "cigarcial@unal.edu.co"
         cc "bikeappteam@gmail.com"
         subject "Validación de Cuenta - BikeApp"
         body  message
      }*/
      //render "OK"
      def msj = "OK"
      render(view:"satisfactorio",model:[msj:msj])
   }

   def confirmar(){
      def user = Usuario.findByUsername(params['username'])
      user.enabled = true
      user.save flush:true,failOnError:true
      //secret match
      def msj = "Tu cuenta ha sido validada, gracias por usar BikeApp!!"
      render(view:"satisfactorio",model:[msj:msj])
   }

   def login(){}
   def logmein(){
      if( params["j_username"].contains("@") ){
         print "OK"
      }
      forward(uri:"/j_spring_security_check",params:[j_username:params["j_username"],j_password:params["j_password"]])
   }

   def correo(){}
   def bikeapp(){}



   def contactUs(String mensaje,String nombre,String email){
      def message = "Nueva sugerencia \n\n"+mensaje+"\n\n"+"Enviado por: "+nombre+" -- "+email
      sendMail {
         async true
         to "bikeappteam@gmail.com"
         subject "SUGERENCIA - "+nombre
         body  message
      }
      def msj = ""
      render(view:"satisfactorio",model:[msj:msj])
   }


}

