<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>
<body>


<h1>Grupos</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link class="create" action="create">Crear grupo</g:link></li>
</ul>
</div>


<div id="lista">
<g:each var="grupo" in="${grupos}">
   <table>
   <tr>
   <td>
   <g:link action="show" params="[ grupoactual : grupo.id]">
   ${grupo.nombre}
   </g:link>
   </td>
   <td>
   ${grupo.descripcion}
   </td>
   </tr>
   </table>
   <br>
</g:each>
</div>


<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->

</body>
</html>

