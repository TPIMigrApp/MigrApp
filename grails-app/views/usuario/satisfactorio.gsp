<html>
<head>
<meta name="layout" content="public"/>
<!--  SE PREGUNTARAN QUE HACE ESTA JS AQUI, SU RAZON DE SER ES QUE NECESITO QUE GRAILS LO RESUELVA Y ESO NO SUPE COMO HACERLO DESDE EL .js-->
<script>
   var link = '<g:createLink controller="usuario" action="index" />'
</script>
<asset:javascript src="usuario.js" />
</head>

<body>



<section id="portfolio-information" class="padding-top">
<div class="container">
<div class="row">

<div class="col-sm-12">

<div class="text-center">

<h2>
   ${msj}
</h2>
   Redireccionamiento al inicio en 5 Segundos.
</div>
</div>
</div>
</div>
</section>

</body>
</html>
