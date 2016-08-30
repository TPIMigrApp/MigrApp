
<div class="portfolio-items">

<g:each in="${eventos}" >

<div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
<div class="portfolio-wrapper">

<div class="portfolio-single">

<!--preview del evento-->
<div class="portfolio-thumb">
<img src="${assetPath(src:'event.png')}" class="img-responsive" alt="">
</div>

<div class="portfolio-view">
<ul class="nav nav-pills">
<li><a href="${createLink(action:'mostrarEvento',params:[evento:it.id])}">
+
</a></li>
<li>

</li>
</ul>
</div>

</div>

<div class="portfolio-info ">
<h2>
${it.nombre}
</h2>
</div>

</div>
</div>

</g:each>

</div>

<!--

<div class="portfolio-pagination">
<ul class="pagination">
<li><a href="#">left</a></li>
<li><a href="#">1</a></li>
<li class="active"><a href="#">3</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">right</a></li>
</ul>
</div>
-->
