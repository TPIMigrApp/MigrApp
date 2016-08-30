package bikeapp
import groovy.transform.ToString

@ToString
class Ruta {

   String nombre
   String descripcion
   String calificacion
   

    static constraints = {
      nombre(nullable:false)
      descripcion(nullable:false)
      calificacion(nullable:true)
    }

}
