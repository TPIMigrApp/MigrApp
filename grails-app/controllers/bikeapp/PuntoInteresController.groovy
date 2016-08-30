package bikeapp

class PuntoInteresController {

	def puntoInteresService
	

    def index() {
    	[usuarios:Usuario.list()]
    }
    
    def registro() {
    	puntoInteresService.agregarPunto(params)
		render(view:index,model:[:])
    }
}
