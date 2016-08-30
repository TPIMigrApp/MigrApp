<g:each in="${comentarios.sort{a,b -> a.compareTo(b) }}" status="i" var="it">
   <table id="comentario_${i}">
   <tr>
    ${it.contenido} 
   </tr>
   <tr>
   <td> <g:link controller="Perfil" action="show" params="[username:it.usuario.username]" >${it.usuario.username} </g:link></td>
   <td> ${it.dateCreated} </td>
   </tr>
   </table>
</g:each>
