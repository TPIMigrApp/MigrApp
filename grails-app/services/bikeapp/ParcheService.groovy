package bikeapp

import grails.transaction.Transactional

@Transactional
class ParcheService {

    def serviceMethod() {

    }
    
    def crearParche(params) {
    	Usuario lider = Usuario.get(params.usuario)
    	def parche = new Parche(nombre:params.nombre,lider:lider.id,descripcion:params.descripcion,lat:params.lat,lon:params.lon)
    	parche.save(failOnError: true)
    }
}
