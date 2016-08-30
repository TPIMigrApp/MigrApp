package bikeapp

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.web.json.*

@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
class CpController {
 	def sesionService
	def puntoInteresService
	def parcheService
    
    def cp() {
    	[rutas: Ruta.list()]
    }
}
