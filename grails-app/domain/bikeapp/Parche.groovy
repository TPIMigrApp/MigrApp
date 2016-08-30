package bikeapp
import groovy.transform.ToString

@ToString
class Parche {

	static hasMany = [ usuarios : Usuario , comentarios: Comentario]
	static belongsTo = [ lider : Usuario ]
	
	String nombre
	String descripcion
	String lat
	String lon

    static constraints = {
    	usuarios(nullable:true)
    	comentarios(nullable:true)
    }
}
