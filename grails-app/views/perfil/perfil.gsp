<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>
<script>
$(document).on('click','#amistad',function(event){
	$.ajax({
		url: 'crearAmistad',			//Llamo a buscarUsuario
		type: 'POST',
		dataType: 'text',					//Que el controlador me devuelva el objeto de tipo JSON.
		data: {
			u1_name:	'ddager',				//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {
			console.log(data);
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
});
</script>
<style type="text/css">
    a{
    color:white;
    }

    a:hover {
     outline: none;
     text-decoration:none;
     color:#4fcccd;
   }
</style>
<div id="buttons-container" style="text-align:center;margin-bottom:2%">
		<h2 class="page-header" >${usuario.username}</h2>
			<button type="button" class="btn btn-lg btn-primary"><g:link action="actualizar" >Actualizar perfil</g:link></button>
			<button type="button" class="btn btn-lg btn-primary"><g:link action="mensajes">Mensajes</g:link></button>
<!--			<button type="button" class="btn btn-lg btn-primary">Amistad</button> -->
</div>

<div class="container">

<div class="row">

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

</div>

</div>
</div>


</body>
</html>
