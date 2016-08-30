package bikeapp
import groovy.transform.ToString

@ToString
class ConvU {

	Usuario u1			//Primer usuario de la conversacion
	Usuario u2			//Segundo usuario de la conversacion

    static constraints = {
    	u1(nullable:false)
    	u2(nullable:false)
    }
}
