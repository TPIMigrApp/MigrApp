<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>



<div class="container" class="padding">

<div class="row">

<h1 class="text-center">${usuario.nombre}</h1>


<div class="col-sm-6 padding">
<g:if test="${usuario.foto == null}"><img src="${assetPath(src:'no_photo.png')}" class="img-responsive"/></g:if>
<g:else><img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" class="img-responsive"/></g:else>
</div>
<div class="col-sm-6 padding" style="text-align:center">
<h2 >Mensaje distintivo:</h2><h2 style="color:#4fcccd"><g:if test="${usuario.mensaje == null} or ${usuario.mensaje ==""}">Sin mensaje</g:if><g:else>${usuario.mensaje}</g:else></h2>
<h2 >	Nombre de usuario:</h2><h2 style="color:#4fcccd"> ${usuario.username}</h2>
<h2 >	Email:</h2>	<h2 style="color:#4fcccd"> ${usuario.email}</h2>
	<h2 >Sexo: </h2>	<h2 style="color:#4fcccd">${usuario.sexo}</h2>
<h2 >	Fecha de Nacimiento: </h2>	<h2 style="color:#4fcccd">${usuario.fecha}</h2>

<h2> <g:link controller="Foto" action="fotosUsuario" params="[username:usuario.username]">Ver sus fotos</g:link></h2>
</div>

</div>
</div>


</body>
</html>
