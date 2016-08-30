<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
	<asset:stylesheet href="evento.css" />
 <asset:javascript src="evento.js" />
	
</head>

<body>

<section id="portfolio">
<div class="container">
<div class="row">


<g:javascript>
var url_obtMisEventos= "${createLink(controller:'Evento',action:'obtenerMisEventos')}"
var url_obtEventos= "${createLink(controller:'Evento',action:'obtenerEventos')}"
</g:javascript>

<ul class="portfolio-filter text-center">
<li><a class="btn btn-default active" href="javascript:obtenerMisEventos('ACTIVOS')">Mis Eventos</a></li>
<li><a class="btn btn-default" href="javascript:obtenerEventos('ACTIVOS')" data-filter="*">Lo que viene</a></li>
<li><a class="btn btn-default" href="javascript:obtenerMisEventos('PASIVOS')" data-filter="*">A lo que fuí</a></li>
<li><a class="btn btn-default" href="javascript:obtenerEventos('PASIVOS')">Lo que me perdí</a></li>
</ul><!--/#portfolio-filter-->

<div id="lista-eventos">
<g:render template="listaEventos" />
</div>



</div>
</div>

</section>



</body> </html>
