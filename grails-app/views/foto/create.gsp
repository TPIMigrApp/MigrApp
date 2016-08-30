<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:stylesheet href="foto.css" />
   </head>
   <body>

      <section id="portfolio">
         <div class="container">
            <div class="row">
<h1>Sube una foto</h1>
               <div class="portfolio-items">
                  <g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
                     <div class="col-sm-6 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                           <div class="portfolio-single">
                              <div class="portfolio-thumb">
                                 <input type="file" id="selector" name="selector" />
                                 <img id="vistaimagen" src=""  />
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-sm-6 ">
                        <fieldset class="buttons">
                           <g:submitButton name="subir-foto" class="save" value="Subir" id="subir-foto" class="btn btn-sm btn-info"/>
                           <g:checkBox name="ubicacion" id="ubicacion" />
                           Incluir ubicación
                           <g:hiddenField id="lat" name="lat" value="NONE" />
                           <g:hiddenField id="lng" name="lng" value="NONE" />
                           <script src="https://maps.google.com/maps/api/js?callback=initMap" async defer></script>
                           <div id="mapa"></div>
                        </fieldset>
                     </div>
                  </g:form>
               </div>
            </div>
         </div>
      </section>
      <asset:javascript src="foto.js"/>
   </body>
</html>
