<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<!-- ATENTOS DIFIERE MI LLAMADO AL DE FELIPE, FELIPE LO HACE INYECTANDO EL MÉTODO EN EL EVENTO POR MEDIO DE DOM-->
<asset:javascript src="evento.js" />
<asset:stylesheet href="evento.css" />
  	<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=es-ES"></script>
</head>

<body>

<h1>Crear ua evento</h1>
<ul>
<li><g:link class="list" action="index">Regresar a las eventos</g:link></li>
</ul>

<g:form url="[resource:instance, action:'guardar']"  enctype="multipart/form-data">
<fieldset class="form">
<div id="formulario">
<div id="controlessubir">
Nombre: <g:textField id="nombre" name="nombre"/>
<br>
Descripcion: <g:textArea id="descripcion" name="descripcion" />
<br>
Fecha y Hora: <g:datePicker id="fecha" name="fecha" precision="minute"/>
<g:hiddenField id="lat" name="lat" value="-1" />
<g:hiddenField id="lng" name="lng" value="-1" />
<br>
Ruta: <g:select name="ruta" value="" from="${rutas.nombre}" />
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Crear" id="create" />
</fieldset>
</div>
<div id="mapa-pe" class="mapa"></div>
<!--
<script src="https://maps.google.com/maps/api/js?callback=iniciarMapasCE" async defer></script>
-->
</fieldset>
<p>
</g:form>


<g:javascript>
document.addEventListener("DOMContentLoaded", function(event) {
iniciarMapasCE();
      });
</g:javascript>

</body>
</html>
