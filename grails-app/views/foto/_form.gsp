<%@ page import="bikeapp.Foto" %>



<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'imagen', 'error')} required">
	<label for="imagen">
		<g:message code="foto.imagen.label" default="Imagen" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="imagen" name="imagen" />

</div>

<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="foto.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${bikeapp.Usuario.list()}" optionKey="id" value="${fotoInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="foto.comentarios.label" default="Comentarios" />
		
	</label>
	<g:select name="comentarios" from="${bikeapp.Comentario.list()}" multiple="multiple" optionKey="id" size="5" value="${fotoInstance?.comentarios*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="foto.lat.label" default="Lat" />
		
	</label>
	<g:textField name="lat" value="${fotoInstance?.lat}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'lon', 'error')} ">
	<label for="lon">
		<g:message code="foto.lon.label" default="Lon" />
		
	</label>
	<g:textField name="lon" value="${fotoInstance?.lon}"/>

</div>

