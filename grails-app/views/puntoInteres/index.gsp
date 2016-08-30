<!DOCTYPE html>
<html lang="en">
  <head>

    <title>BikeApp - ¡Muevete por Bogotá!</title>

  </head>

  <body>
	<g:form name="myForm" controller="puntoInteres">
		<label>Coordenada x:</label><g:textField name="x"/>
		<label>Coordenada y:</label><g:textField name="y"/>
		<label>Nombre:</label><g:textField name="nombre"/>
		<label>Descripción:</label><g:textField name="descripcion"/>
		<label>Calificacion:</label><g:textField name="calificacion"/>
		<label>Dueño:</label><g:select name="dueño" from="${usuarios}" value="Usuario" optionKey="id" optionValue="usuario"/>
		<g:actionSubmit action="registro" value="Registrar!"/>
	</g:form>
  </body>
</html>
