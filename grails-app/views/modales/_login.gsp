
<div id="modalLogin" class="modal fade" role="dialog">
<div class="modal-dialog">



<!-- Modal content-->
<div class="modal-content">

<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title">Inicia tu sesión</h4>
</div>

<div class="modal-body">



<div class="text-center">

<h1> Ingresa tus datos </h1>
<g:form name="login" method="POST" uri="/j_spring_security_check">
<div class="form-group">
<input type="text" class="form-control text-center" name="j_username" style="width:50%;margin-left:25%" required placeholder="Ingrese su nombre de usuario o correo">
</div>
<div class="form-group">
<input type="password" class="form-control text-center" name="j_password" style="width:50%;margin-left:25%" required placeholder="Ingrese su contraseña">
</div>

<div class="form-group">
<input type="submit" name="submit" class="btn btn-lg bnt-success" value="Iniciar Sesión">
</div>

</g:form>
</div>


</div>
</div>

</div>
</div>
