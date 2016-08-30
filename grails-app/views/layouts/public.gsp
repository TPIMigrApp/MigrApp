<!DOCTYPE html>
  <head>

   	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><g:layoutTitle default="BikeApp - ¡Muevete por Bogotá!"/></title>


    <!-- Agregamos CSS. /assets/css/ -->
	<asset:stylesheet src="bootstrap.min.css" />
	<asset:stylesheet src="font-awesome.min.css" />
	<asset:stylesheet src="animate.min.css" />
	<asset:stylesheet src="lightbox.css" />
	<asset:stylesheet src="main.css" />
	<asset:stylesheet src="responsive.css" />

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->

	<!-- Agregamos javascripts. /assets/javascripts/ -->
   	<asset:javascript src="jquery.js" />
	<asset:javascript src="bootstrap.min.js" />
	<asset:javascript src="lightbox.min.js" />
	<asset:javascript src="wow.min.js" />
	<asset:javascript src="main.js" />
    <g:layoutHead/>

  </head>
<body>
<!--                     INICIO DEL LAYOUT PARA UN USUARIO CON SESION ACTIVA -->

<sec:ifLoggedIn>
<script>
var link = '<g:createLink controller="perfil" action="index" />'
window.location.replace(link);
</script>
</sec:ifLoggedIn>


   <!--                     FIN DEL LAYOUT PARA UN USUARIO CON SESION ACTIVA -->
   <!--                     INICIO DEL LAYOUT PARA UN USUARIO SIN SESION ACTIVA -->

   <sec:ifNotLoggedIn>

    <header id="header">
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href='<g:createLink uri="/"/>'>
                         <g:img  dir="images" file="smlogotipo1.png" alt="BikeApp-Logo"/>
                    </a>

                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <!-- vista intermedia de registro -->

                        <!--<li><a href="#modalLogin">Iniciar Sesión</a></li>-->
                                <li><a data-toggle="modal" href="#modalLogin" >Iniciar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

<g:render template="/modales/login" />

</sec:ifNotLoggedIn>


   <g:layoutBody/>






	<footer id="footer">
        <div class="container">
            <div class="row">
<!--
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="<g:resource dir='images/home' file='under.png'/>" class="img-responsive inline" alt="WHAAAAAT">
                </div>

-->
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p><a href="${createLink(controller:'usuario',action:'bikeapp')}">&copy; BikeApp 2016</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
   <!--                     FIN DEL LAYOUT PARA UN USUARIO SIN SESION ACTIVA -->
  </body>
</html>
