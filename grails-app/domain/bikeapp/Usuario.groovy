package bikeapp
import groovy.transform.ToString

//SE REALIZAN DOS CAMBIOS IMPORTANTES EN ESTA CLASE
// LA PRIMERA ES FIJARSE QUE AHORA ESTA CLASE HEREDA DE LA CLASE SECUSUARIO, LA CUAL 
//ES LA CLASE QUE SPRING UTILIZA PARA MANEJAR LOS USUARIOS, SI CONSULTAN LA BASE DE DATOS SE DARAN CUENTA 
//QUE CUANDO SE CREA UN USUARIO ESTA CREACION SE VE REFLEJADA SOBRE LA CLASE SECUSUARIO
//LA SEGUNDA ES LA ELIMINACION DEL CAMPO usuario Y contrasena ESTOS CAMPOS AHORA SE LLAMAN 
// username Y password LOS CUALES VIVEN EN LA CLASE SECUSUARIO, ESTO SE DEBE A QUE AHORA ESTOS CAMPOS VAN A SERVIR COMO PUNTO DE AUTENTICACION
//ADEMAS QUE SPRING UTILIZA CIERTOS ALGORITMOS PARA CIFRAR Y MANEJAR ASUNTOS DE CLAVES
@ToString
class Usuario extends SecUsuario{


      //SE CAMBIA LA RELACION YA NO VOY A USAR LA RELACION MUCHOS A MUCHOS DE GRAILS
      //QUE NO ME PREGUNTAN PERO ES DEL ASCO, NO ME QUISO TRABAJAR BIEN, CUANDO NO ERA UNA COSA ERA LA OTRA Y AL FINAL 
      //NO DEJO GUARDAR EN LA BASE DE DATOS
      //VER LA 'TABLA' INTERMEDIA 'UsuarioGrupo'

	static hasMany = [puntos: PuntoInteres, fotos: Foto,comentarios:Comentario,grupos:Grupo,aportes:Aporte]

      String email		//Email del usuario
      String fecha		//Fecha nacimiento
      String interes		//Lista de intereses
      String nombre		//Nombre real del usuario
      String sexo			//Sexo del usuario
      String mensaje		//Mensaje dinstintivo del usuario
      String secret;
      byte[] foto
  
   static constraints = {
      email(nullable:false, email:true, unique:true)
      foto(nullable:true, maxSize:1073741824)
      fecha(nullable:false)
            interes(nullable:true)
            puntos(nullable:true)
            nombre(nullable:true)
            sexo(nullable:true)
            mensaje(nullable:true)
            secret(nullable:true)
      }

}
