package bikeapp
import groovy.transform.ToString

@ToString
class PuntoInteres {

   static belongsTo = [ usuario : Usuario,evento:Evento]

   double lat
   double lng
   String nombre
   String descripcion
   double calificacion
   String tipo
   int orden
   Ruta ruta

   static constraints = {
      usuario(nullable:false)
      ruta(nullable:true)
      nombre(nullable:true)
      descripcion(nullable:true)
      calificacion(nullable:true)
      evento(nullable:true)
      orden(nuallble:true)
      tipo(nullable:true)
   }
   static mapping = {
        sort 'orden'
    }
}
