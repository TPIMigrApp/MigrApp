package bikeapp
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
class AporteController {

   def sesionService

   def save(){		
      params.usuario=sesionService.usuarioEnSesion() 	
      params.fecha=new Date()  	         
      def aporte= new Aporte(params)	    
      aporte.save flush: true, failOnError:true
      redirect(controller:"Grupo",action: "actualizarComentarios", params:[ grupoActual : params.grupo]);
   }

}
