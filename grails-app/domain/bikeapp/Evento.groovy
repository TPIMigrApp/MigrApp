package bikeapp
import groovy.transform.ToString

@ToString
class Evento {

   static belongsTo = [ lider: Usuario, ruta : Ruta ]

   Date fecha
   String descripcion
   PuntoInteres puntoEncuentro
   String nombre

   static constraints = {
      lider(nullable:false)
      ruta(nullable:true)
      descripcion(nullable:false)
      puntoEncuentro(nullable:true)
      fecha(nullable:true)
   }
}
