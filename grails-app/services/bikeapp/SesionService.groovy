package bikeapp

import grails.transaction.Transactional

//UN PEQUEÑO SERVICIO QUE NOS PERMITE CONOCER EL USUARIO QUE SE ENCUENTRA EN SESION ACTUALMENTE
//LO HAGO PARA NO TENER QUE ESTAR HACIENDO LO MISMO EN TODAS LAS CLASES QUE NECESITEN DE ESTA UTILIDAD
//PARA VER SU FUNCIONAMIENTO VER EL EJEMPLO EN FOTOS
@Transactional
class SesionService {

   def springSecurityService

   def usuarioEnSesion(){
      return Usuario.get(springSecurityService.principal.id)
   }
}
