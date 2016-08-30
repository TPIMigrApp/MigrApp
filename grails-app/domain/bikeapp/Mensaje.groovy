package bikeapp
import groovy.transform.ToString

@ToString
class Mensaje {

	String contenido
	Date fecha
	ConvU conversacion
	Usuario dueño
	
	
	
    static constraints = {
    	contenido(nullable:false)
    	fecha(nullable:false)
    	conversacion(nullable:false)
    	dueño(nullable:false)
    }
}
