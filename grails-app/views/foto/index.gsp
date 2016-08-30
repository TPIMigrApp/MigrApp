<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:javascript src="foto.js"/>
      <asset:stylesheet href="foto.css" />
   </head>
   <body>

      <section id="portfolio">
         <div class="container">
            <div class="row">
               <ul class="portfolio-filter text-center">
                  <g:link type="button" class="btn btn-lg btn-info" action="create"><i class="fa fa-picture" aria-hidden="true"></i>  Añadir Foto</g:link>
               </ul>
               <div class="portfolio-items">
                  <g:each var="imagen" in="${imagenes}" status="i">
                     <div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                           <div class="portfolio-single">
                              <div class="portfolio-thumb">
                                 <img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" height="300" width="200" style="margin-top:2%">
                              </div>
                              <div class="portfolio-view">
                                 <ul class="nav nav-pills">
                                    <li>
                                       <g:link action="show" params="[imagenactual : imagen.id]">+</g:link>
                                    </li>
                                    <li><a href="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" data-lightbox="example-set">目</a></li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </g:each>
               </div>
            </div>
         </div>
      </section>
	  </body>
</html>
