<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:javascript src="evento.js" />
<asset:stylesheet href="evento.css" /> 
</head>

<body>


<section id="portfolio-information" class="padding-top">
<div class="container">
<div class="row">

<div class="col-sm-6">
<ul id="tab1" class="nav nav-tabs">
<li class="active"><a href="#tab1-item1" data-toggle="tab">Punto de Encuentro</a></li>
<li><a href="#tab1-item2" data-toggle="tab" id="to_map2">Mapa de Ruta</a></li>
</ul>



<div class="tab-content">

<div class="tab-pane fade active in" id="tab1-item1">
<div id="mapa-pe" class="mapa">
</div>
</div>

<div class="tab-pane fade" id="tab1-item2">
<div id="mapa-rt" class="mapa">
</div>
</div>
</div>
</div>

<div class="col-sm-6">

<div class="project-name overflow">
<h2 class="bold">Nombre: ${evento.nombre} </h2>
</div>

<div class="project-info overflow">
<h3>Informacion del Evento</h3>
<p>
${evento.descripcion}
</p>
<ul class="elements">
<li><i class="fa fa-angle-right"></i> Organizado por: ${evento.lider.nombre}.</li>
<li><i class="fa fa-angle-right"></i> Fecha y hora del evento: ${evento.fecha}.</li>
</ul>
</div>

<div class="client overflow">
<h3>Asistentes:</h3>
<ul class="nav navbar-nav navbar-default">
<g:each in="${asistentes}">
<li><a href="${createLink(controller:'perfil',action:'show',params:[username:it.usuario.username])}"><i class="fa fa-bolt"></i>${it.usuario.nombre}</a></li>
</g:each>
</ul>
</div>

<g:if test="${asis && valido}">
<div class="live-preview">
<a href="${createLink(action:'registrarme',params:[evento:evento.id])}" class="btn btn-common uppercase">Registrarme!!</a>
</div>
</g:if>

</div>

</div>
</div>
</section>


<g:javascript>
document.addEventListener("DOMContentLoaded", function(event) {
      callback(${puntosRuta as JSON},${evento.puntoEncuentro as JSON});
      });
</g:javascript>

</body>
</html>
