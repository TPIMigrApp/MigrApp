<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<asset:javascript src="mensajes.js"/>
<asset:stylesheet src="mensajes.css"/>
</head>

<body>
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			 <div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">Mensajes</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class = "container">
		<div class = "row">
			<div class = "col-md-3 col-sm-5">
				<div class="sidebar blog-sidebar">
					<div class="sidebar-item  recent" id="amigos">
						<h3>Amigos</h3>
						<g:each var="contacto" in="${conversaciones}">
							<div class="media">
								<div class="media-body">
									<g:if test="${ usuario.nombre == contacto.u1.nombre  }">
										<div class="contacto"><h4>${contacto.u2.username}</h4></div>
									</g:if>
									<g:if test="${ usuario.nombre == contacto.u2.nombre  }">
										<div class="contacto"><h4>${contacto.u1.username}</h4></div>
									</g:if>
								</div>
							</div>	
						</g:each>
					</div>
					<div class="sidebar-item  recent">
						<h3></h3>
						<h4 id="opener">Nueva Conversacion</h4>
					</div>
				</div>
			</div>
			<div class = "col-md-7 col-sm-7">
				<div id="mensajes">
				</div>
				<div id="input">
					<g:form>
						<input type="text" id="contenido" value="Por favor escriba un mensaje"/>
						<button id="cm">Enviar!</button>
					</g:form>
				</div>
			</div>
			
		</div>
	</div>

<div id="dialog" title="Seleccione un amigo">
						<g:each var="amigo" in="${usuarios}">
							<div class="amigo">${amigo.username}</div>
						</g:each>
					</div>


<script>
var nomUsuario = "${usuario.username}";
var theDialog = $( "#dialog" ).dialog({
	autoOpen: false,
	buttons:
	[
		{
		  text: "Crear Conversacion",
		  click: function() {
			crearConversacion();
			$( this ).dialog( "close" );
		  }
		}
	] 
});

</script>
</body>
</html>