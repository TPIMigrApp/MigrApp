package bikeapp

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.web.json.*

class RutaController {
	def sesionService
    def index() { }

   def registro(){
     def ruta = new Ruta(params)
     ruta.save(failOnError:true)
   }
   
	@Secured(['ROLE_ADMIN'])
	def guardarRuta(){
		def initMarker = JSON.parse(params.initMarker)
		def wayPoints = JSON.parse(params.wayPoints)
		def endMarker = JSON.parse(params.endMarker)
		def punto
		int counter = 1;
		
print params
params.nombre = "hola"
		
		def rutas = new Ruta(nombre:params.nombre, descripcion:params.descripcion,calificacion:"Sin Calificar")
		rutas.save flush:true,failOnError:true
		
		def punto1 = new PuntoInteres(lat:initMarker.lat,lng:initMarker.lng,ruta:rutas,usuario:sesionService.usuarioEnSesion(),orden:counter++)
		punto1.save(flush:true)
		int i = 0
		def puntoss
		JSONArray array = new JSONArray(wayPoints);
 		List<JSONObject> list = new ArrayList();
 		for (i = 0; i < array.length(); i++){
 			list.add(array.getJSONObject(i));
 			puntoss = new PuntoInteres(lat:list[i].location.lat,lng:list[i].location.lng,ruta:rutas,usuario:sesionService.usuarioEnSesion(),orden:counter++)
			puntoss.save(flush:true)
		}

		def punto2 = new PuntoInteres(lat:endMarker.lat,lng:endMarker.lng,ruta:rutas,usuario:sesionService.usuarioEnSesion(),orden: counter)
		punto2.save(flush:true)
		
		render "exito :)"
    }
    
    
    @Secured(['ROLE_ADMIN'])
	def buscarRuta(){
		def ruta = Ruta.findByNombre(params.nombreRuta)
		JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render PuntoInteres.findAllByRuta(ruta) as JSON
      	}

    }
   
}
