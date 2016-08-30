<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
    <title>Panel de Control - Admin</title>
    <asset:stylesheet src="cp-mapa.css"/>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=es-ES"></script>
  	<asset:javascript src="cp-ruta.js"/>
  	<asset:stylesheet src="cp-modal.css"/>
  	<script>
  		var rutas_all = ${rutas as JSON};
  	</script>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      html {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
  </head>
  <body>
  	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			 <div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">Panel de Control</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
  	<div id="cp-left-container">
  		<div id="accordion-container">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								Rutas
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<ul>
								<li>Nueva Ruta</li>
								<li>Modificar Ruta</li>
								<li>Eliminar Ruta</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
								Usuarios
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							Utilidades para la administracion de usuarios
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
								Permisos
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						<div class="panel-body">
							Utilidades para los permisos del aplicativo.
						</div>
					</div>
				</div>
			</div><!--/#accordion-->
		</div><!--/#accordion-container-->
  	</div>
  	<div id="wrapper">
    	<div id="cp-map-container">
    	</div>
    </div>
    
  </body>
</html>
