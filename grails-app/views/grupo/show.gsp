<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="grupo.css"/>
<asset:javascript src="grupo.js"/>
</head>

<body>
<h1>Bienvenidos al grupo ${grupo.nombre}</h1>

<div id="general">

<div id="comments">
<g:render template="aporte" model="[aportes:grupo.aportes]" />
</div>

<div id="rutinas">
<g:render template="union" />
</div>

<g:each in="${grupo.tags}">
   ${it}<p>
</g:each>

</div>

</body>
</html>

