<div class="sidebar-item  recent">

<g:if test="${miembro}">

<h3>Unirme</h3>
<form name="join">
<input type="button" name="buscar" class="btn btn-submit" value="Unirme" onclick="unirme()">
<g:hiddenField name="grupoId" value="${grupo.id}"/>
<g:javascript>
var url = "${createLink(controller:'Grupo',action:'unirme')}"
</g:javascript>
</form>

</g:if>

<g:else>

<h3>Aportar</h3>
<form name="aporte">

<div class="form-group">
<textarea name="contenido" id="contenido" required="required" class="form-control" rows="3" placeholder="Escribe tu aporte aqui"></textarea>
</div>                        

<div class="form-group">
<input type="button" name="enviar" class="btn btn-submit" value="Aportar" onclick="aportar()" >
</div>

<g:hiddenField id="grupoId" name="grupo" value="${grupo.id}" />
<g:javascript>
var url2 = "${createLink(controller:'Grupo',action:'crearAporte')}"
</g:javascript>

</form>
</g:else>

</div>
