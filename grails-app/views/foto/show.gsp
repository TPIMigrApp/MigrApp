<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:javascript src="foto.js"/>
      <asset:stylesheet href="foto.css" />
   </head>
   <body>

      <section id="portfolio-information" class="padding-top">
         <div class="container">
            <div class="row">
               <div class="col-sm-6">
                  <img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" class="img-responsive" alt="">
               </div>
               <div class="col-sm-6">
                  <div id="dialogbox">
                     <g:render template="comentario" model="[comentarios:comentarios]" />
                  </div>
                  <form  name="comentario" >
                     <div class="form-group">
                        <g:textArea name="contenido" class="form-control" rows="8" placeholder="Aquí ingresas tu comentario"></g:textArea>
                     </div>
                     <div class="form-group">
                        <a class="btn btn-common" onclick="save()" >Comentar!</a>
                     </div>
                     <g:hiddenField name="fotoId" value="${inx}"/>
                     <g:javascript>
                        var url = "${createLink(controller:'comentario',action:'save')}"
                     </g:javascript>
                  </form>
               </div>
            </div>
         </div>
      </section>
   </body>
</html>
