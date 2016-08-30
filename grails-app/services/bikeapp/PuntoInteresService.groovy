package bikeapp
import groovy.json.*

import grails.transaction.Transactional
import grails.converters.XML

@Transactional
class PuntoInteresService {

    def serviceMethod() {

    }
    
    def agregarPunto(params) {
    	Usuario test = Usuario.get(params.dueño)
    	PuntoInteres local = new PuntoInteres(lat:params.lat,lon:params.lon,nombre:params.nombre,descripcion:params.descripcion,calificacion:"N/A",tipo:params.tipo,usuario:test)
    	local.save(failOnError: true)
    }
    
    def agregarPuntoAJAX(nombre, lat, lon, tipo, descripcion, usuario, ruta) {
    	Usuario test = Usuario.get(usuario)
    	PuntoInteres local = new PuntoInteres(lat:lat,lon:lon,nombre:nombre,descripcion:descripcion,calificacion:0,tipo:tipo,usuario:test)
    	local.save(failOnError: true)
    }
    
    
    
}
