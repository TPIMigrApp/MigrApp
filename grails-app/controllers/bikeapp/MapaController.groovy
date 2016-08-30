package bikeapp

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.web.json.*

class MapaController {
 	def sesionService
	def puntoInteresService
	def parcheService
	@Secured(['ROLE_USUARIO','ROLE_ADMIN'])
    def index() {
    	//Envía al cliente una lista de los puntos, usuarios y parches. Para utilizarlos en el FrontEnd.
		[puntos : PuntoInteres.list(), usuarios : Usuario.list(), parches: Parche.list()]
    }
    
    @Secured(['ROLE_ADMIN'])
    def cp() {
    	[rutas: Ruta.list()]
    }
    
    def registrar() {
    	puntoInteresService.agregarPunto(params)
    	render(view: 'index',model: [puntos : PuntoInteres.list(), usuarios : Usuario.list(),parches : Parche.list()])
    }

    //Controlador que recibe la llamada AJAX.
    def registrarPuntoTest() {
    	//Utiliza los parametros de la llamada AJAX y el servicio de PuntoInteres para crear un nuevo punto en la BD.
    	puntoInteresService.agregarPuntoAJAX(params.nombre, params.lat, params.lon, params.tipo, params.descripcion, params.usuario, params.ruta)
    	render "Hello"
    }

    def parche() {
    	parcheService.crearParche(params)
    	render(view: 'index',model: [parches : Parche.list(), usuarios : Usuario.list(),puntos : PuntoInteres.list()])
    }
}
