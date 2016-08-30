package bikeapp

class UsuarioEvento implements Serializable{

   Evento evento
   Usuario usuario

   static constraints ={
      evento(nullable:false)
      usuario(nullable:false)
   }

   static mapping = {
      id composite:['evento','usuario']
   }
}
