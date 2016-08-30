package bikeapp
import groovy.transform.ToString

@ToString
class Amistad {

	Usuario u1			//Primer usuario de la amistad
	Usuario u2			//Segundo usuario de la amistad
	Date	fecha
	

    static constraints = {
    	u1(nullable:false)
    	u2(nullable:false)
    	fecha(nullable:false)
    }
}
