<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css" />
<asset:javascript src="foto.js"/>
</head>
<body>

      <section id="portfolio" class="padding">
         <div class="container">
            <div class="row">
<h1 class="text-center" style="margin-bottom:5%">Fotos de ${usuario.nombre}</h1>
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
                                       <g:link action="show" params="[imagenactual : imagen.id]"><i class="fa fa-link"></i></g:link>
                                    </li>
                                    <li><a href="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                 </ul>
                              </div>
                           </div>
                           <div class="portfolio-info ">
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
