<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="public"/>
<asset:stylesheet href="publico" />
</head>

<body>


<section id="portfolio-information" class="padding-top">
<div class="container">
<div class="row">

<div class="col-sm-12">
<center>
<h2>Por favor inicia sesión </h2>
</center>
<div class="text-center">

<g:form name="login" method="POST" uri="/j_spring_security_check">
<div class="form-group">
<input type="text" class="form-control text-center" name="j_username" style="width:34%;margin-left:33%" required placeholder="Ingrese su nombre de usuario o correo">
</div>
<div class="form-group">
<input type="password" class="form-control text-center" name="j_password" style="width:34%;margin-left:33%" required placeholder="Ingrese su contraseña">
</div>

<div class="form-group">
<input type="submit" name="submit" class="btn btn-lg bnt-success" value="Iniciar Sesión">
</div>

</g:form>


</div>


<div class="project-info overflow">
<h3 style="text-align:center">Recuerda:</h3>
<ul class="elements">
<li style="text-align:center">  Revisar las mayúsculas </li>
<li style="text-align:center"> Ingresar tu nombre de usuario y contraseña de forma correcta </li>
<li style="text-align:center"> Validar tu cuenta, sino recibiste el correo haz click <g:link controller="usuario" action="correo" >aquí</g:link></li>
</ul>
</div>

</div>
</div>
</div>
</section>





</body>
</html>
