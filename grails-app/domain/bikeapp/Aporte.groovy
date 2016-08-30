package bikeapp
import groovy.transform.ToString

@ToString
class Aporte implements Comparable<Aporte>{

	 
	static belongsTo = [ grupo: Grupo, usuario:Usuario ]

	String contenido
      //esto debe ser de tipo fecha
	Date dateCreated

    static constraints = {
    	grupo(nullable:false)
    	usuario(nullable:false)
    	contenido(nullable:false)
    }

   @Override
   public int compareTo(Aporte other){
      return other.dateCreated.compareTo(dateCreated)
   }

}
