package bikeapp
import groovy.transform.ToString

@ToString
class Comentario implements Comparable<Comentario>{

   //Hay que tener presente la relación que exite entre estos tres personajes
   static belongsTo = [usuario:Usuario, foto:Foto]

   //este campo es capturado de forma automatica por grails, y debe ir con ese nombre que tiene
   Date dateCreated
   String contenido

   static constraints = {
      contenido(nullable:false)
      usuario(nullable:false)
      foto(nullable:false)
   }


   @Override
   public int compareTo(Comentario other){
      return dateCreated.compareTo( other.dateCreated)
   }
}
