package bikeapp


//TABLA INTERMEDIA QUE NOS PERMITE SIMULAR LA RELACION MUCHOS A MUCHOS EN GRAILS
//LA INCLUI DADA LA COMPLEJIDAD QUE ME ESTABA PRESENTANDO LA RELACION MUCHOS A MUCHOS EN GRAILS
//LA IDEA ORIGINAL FUE TOMADA DEL SIGUIENTE POST http://stackoverflow.com/questions/14941705/many-to-many-in-grails-is-not-saving-records-in-the-relationship-table
//ESTA NOS PERMITE SIMULAR LA TABLA INTERMEDIA QUE SE GENERA CUANDO HAY NORMALIZACION EN LA BASE DE DATOS
class UsuarioGrupo implements Serializable{

   Grupo grupo
   Usuario usuario

   static constraints ={
      grupo(nullable:false)
      usuario(nullable:false)
   }

   static mapping = {
      id composite:['grupo','usuario']
   }

}

