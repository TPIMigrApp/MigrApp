<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<!-- Cargamos el css propio de la pagina antes del layout para que sobreescriba solo lo que necesitamos -->
  	<asset:stylesheet src="mapa.css"/>
  	<meta name="layout" content="main"/>
  	<asset:javascript src="mapa.js"/>
  	<asset:javascript src="ruta.js"/>
    <title>Mapa</title>
  </head>
  <body>
  	<g:javascript>
  		
		document.addEventListener("DOMContentLoaded", function(event) {
    		test(${puntos as JSON},${parches as JSON});
  		});
	</g:javascript>
    <div id="map-container">
        <div id="gmap"></div>
        <div id="right-panel"></div>
    </div>
  </body>
</html>
