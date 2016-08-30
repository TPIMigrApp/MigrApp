<g:each in="${grupo.aportes.sort{a,b -> a.compareTo(b)}}" status = "i" var="aporte">
<div class="col-md-12 col-sm-12">
<div class="single-blog two-column">

<div class="col-sm-6">

<div class="project-name overflow">
<h2 class="bold">
<g:link controller="perfil" action="show" params="[username : aporte.usuario.username]">
Aporte de ${aporte.usuario.nombre}
</g:link>
</h2>

<!--
<ul class="nav navbar-nav navbar-default">
<li><a href="#"><i class="fa fa-clock-o"></i>
</a></li>
</ul>
-->

</div>


<div class="project-info overflow">
<h3>
${aporte.contenido}
</h3>
<p>
${aporte.dateCreated}
</p>
</div>

</div>

</div>
</div>



<!--
<a href="#" class="read-more">View More</a>
<div class="post-bottom overflow">
<ul class="nav navbar-nav post-nav">
<li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
<li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
<li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
</ul>
</div>
-->


</g:each>
