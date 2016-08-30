<!DOCTYPE html>
<html lang="en">
<head>
  	<meta name="layout" content="public"/>
</head>

<body>


<section id="portfolio-information" class="padding-top">
<div class="container">
<div class="row">

<div class="col-sm-12">

<div class="text-center">
<h2>
Por favor ingresa tu nombre de usuario.
</h2>


<g:form url="[action:'reenviar']"  enctype="multipart/form-data">


<div class="form-group">
<input type="text" class="form-control text-center" name="usuario" style="width:34%;margin-left:33%" required placeholder="Ingrese su nombre de usuario">
</div>

<div class="form-group">
<input type="submit" name="submit" class="btn btn-lg bnt-success" value="Enviar Correo">
</div>
</g:form>



</div>



</body>
</html>
