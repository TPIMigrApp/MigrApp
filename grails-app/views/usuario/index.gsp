<!--                    VISTA DEPRECIADA -->

<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="layout" content="public"/>
  </head>

  <body>
	<g:form name="myForm" controller="usuario">
		<label>Nombre de Usuario:</label><g:textField name="usuario"/>
		<label>Nombre real:</label><g:textField name="nombre"/>
		<label>Email:</label><g:textField name="email"/>
		<label>Contraseña:</label><g:textField name="contrasena"/>
		<label>Fecha:</label><g:textField name="fecha"/>
		<g:actionSubmit action="registro" value="Registrar!"/>
	</g:form>
  </body>
</html>
