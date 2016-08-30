<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>Crear un grupo</h1>
<ul>
<li><g:link class="list" action="index">Regresar a mis grupos</g:link></li>
</ul>
</div>

<div role="navigation">
<g:form url="[resource:grupoInstance, action:'save']"  enctype="multipart/form-data">
<fieldset class="form">


<div id="controlessubir" class="controlessubir">
Nombre del grupo: <g:textField name="nombre" />
<p>
Descripcion del grupo<g:textArea name="descripcion" />
<p>
Tags <g:textArea name="tags"/>
</div>

</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Crear" id="create" />
</fieldset>
</g:form>
</div>


<asset:javascript src="foto.js" />
<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
</body>
</html>

