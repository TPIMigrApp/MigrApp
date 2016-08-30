package bikeapp
import groovy.transform.ToString
import java.util.Date

@ToString
class Foto {

   static belongsTo = [ usuario: Usuario ]   
   static hasMany = [comentarios: Comentario]

   Date dateCreated
   byte[] imagen
   PuntoInteres puntoImagen

   static constraints = {
      imagen(nullable:false, maxSize:1073741824)
      usuario(nullable:true)
      puntoImagen(nullable:true)
   }
}
