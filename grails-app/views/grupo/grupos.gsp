<html>
<head>
<meta name="layout" content="main"/>
<asset:javascript src="grupo.js" />
<asset:stylesheet href="grupos.css" />

</head>



<body>

<section id="blog" class="padding-top">
<div class="container">
<div class="row">

<div class="col-md-3 col-sm-5">
<div class="sidebar blog-sidebar">

<div class="sidebar-item  recent">
<h3>Buscar Grupos</h3>
<div class="media">
<g:javascript>
var url_busGrupo = "${createLink(controller:'Grupo',action:'buscarGrupos')}"
</g:javascript>
<div class="form-group">
<input type="text" name="tags" class="form-control" required="required" placeholder="Tags a buscar" id="gp-tags">
<input type="button" name="buscar" class="btn btn-submit" value="Buscar" onclick="buscarGrupos()" id="buscar">
</div>
</div>
</div>

<div class="sidebar-item categories">
<h3>Grupos</h3>
<ul class="nav navbar-stacked" id="listaGrupos">
<g:render template="listaGrupos" />
</ul>



</div>

</div>
</div>

<div class="col-md-9 col-sm-7">
<div class="row" id="contenido-grupo">
<g:render template="grupo" />
</div>
</div>

</div>
</div>
</section>


<!--/#blog-->
<!--/#blog-->
<!--/#blog-->
<!--/#blog-->


</body>
</html>
