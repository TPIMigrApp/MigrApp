
<g:if test="${grupo != null}">

<section id="blog">
<div class="container">
<div class="row">


<h1>Bienvenidos al grupo ${grupo.nombre}</h1>

<!--
<div class="col-md-9 col-sm-7">
<div class="row" id="comments">
-->

<div class="col-sm-6">
<div class="project-name overflow" id="comments">
<g:render template="aporte" model="[aportes:grupo.aportes]" />
</div>
</div>



<div class="col-md-3 col-sm-5">
<div class="sidebar blog-sidebar">

<div id="rutinas">
<g:render template="union" />
</div>

<div class="sidebar-item  recent">
<h3>Información del grupo</h3>
${grupo.descripcion}
</div>


<div class="sidebar-item tag-cloud">
<h3>Tag del Grupo</h3>
<ul class="nav nav-pills">
<g:each in="${grupo.tags}">
<li><a href="javascript:buscarTag('${it}')">${it}</a></li>
</g:each>
</ul>
</div>

<div class="sidebar-item popular">
<h3>Miembros</h3>
<ul class="gallery">
<g:each var="miembro" in="${miembros}">
<li><a href="${createLink(controller:'perfil',action:'show',params:[username:miembro.usuario.username])}">
<!--<img src="${assetPath(src:'photo.gif')}" class="img-responsive" alt="">-->

<img src="${assetPath(src:'photo.gif')}" alt=""> 
 ${miembro.usuario.nombre}
</a></li>
</g:each>
</ul>
</div>

</div>
</div>

</div>
</div>
</section>


</g:if>
