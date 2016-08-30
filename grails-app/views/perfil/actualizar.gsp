<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

  <div class="container">
  <div class="row">
    <g:form action="update"  enctype="multipart/form-data">
    <div class="col-sm-6 padding">
    <div id="controlessubir" class="controlessubir">
      <g:if test="${usuario.foto == null}"><img src="${assetPath(src:'no_photo.png')}" class="img-responsive"/></g:if>
      <g:else><img id="vistaimagen" src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" class="img-responsive"/></g:else>
      <br>
      <input type="file" id="fileload" name="selector" />
</div></div><div class="col-sm-6 " style="text-align:center">
<h2 >Mensaje distintivo:</h2><h2 style="color:#4fcccd"><g:textArea name="mensaje" value="${usuario.mensaje}" /></h2>
<h2 >	Nombre de usuario:</h2><h2 style="color:#4fcccd"> <g:textField name="username" value="${usuario.username}" /></h2>
<h2 >	Email:</h2>	<h2 style="color:#4fcccd"> <g:textField name="email" value="${usuario.email}" /></h2>
<h2 >Sexo: </h2>	<h2 style="color:#4fcccd"><g:select name="sexo" value="${usuario.sexo}" from="${sexos}" /></h2>
<h2 >	Fecha de Nacimiento: </h2>	<h2 style="color:#4fcccd"><g:textField name="fecha" value="${usuario.fecha}" /></h2>
</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="update" class="update" value="Actualizar" id="update" />
</fieldset>
</g:form>
</div></div>
</div>
</div>


<asset:javascript src="perfil.js"/>

</body>
</html>
