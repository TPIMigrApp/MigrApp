<!DOCTYPE html>
<html lang="en">
<head>
 <meta name="layout" content="public"/>
 <asset:javascript src="usuario.js" />

  <link rel="shortcut icon" type="image/x-icon" href='${resource(dir: "images", file: "smlogo.png")}' />

 <style type="text/css">
 #home-slider {
  background: url('${resource(dir: "images/home", file: "slider-bg.png")}') 20% 100%;
  position: relative;
}
</style>
</head>
  
<body>
 <g:javascript>
  var url_enviarSugerencia= "${createLink(controller:'Usuario',action:'contactUs')}"
</g:javascript>


<section id="home-slider">
  <hr style="background-color: rgb(212,96,82);height: 10px;margin-top: 0px !important;width: 95%;"/>
        <div class="container">
            <div class="row">
                <div class="main-slider animate-in">
                    <div class="slide-text">
                        <center><h1 style="margin-top:10px">¡Regístrate! </h1></center>


                        <g:form role="form" class="form-horizontal" name="registro" controller="Usuario" action="registro">
                            <div class="form-group">                           
                                
                                  <label class="control-label col-sm-3" for="username" style="margin-top: -20px;"><h3>Usuario:</h3></label>  
                                  <div class="col-sm-9"> 
                                      <input type="text" class="form-control input-sm" name="username" required placeholder="Ingrese un nombre de usuario"> 
                                  </div>   
                             
                            </div>


                            <div class="form-group">
                              <label class="control-label col-sm-3" for="nombre" style="margin-top: -20px;"><h3>Nombre:</h3> </label>
                              <div class="col-sm-9"> 
                              <input type="text" class="form-control input-sm" name="nombre" required placeholder="Ingrese el nombre real del usuario">
                              </div>  
                            </div>

                        
                          
                            <div class="form-group">
                              <label class="control-label col-sm-3" for="email" style="margin-top: -20px;"><h3>Email:</h3></label>
                              <div class="col-sm-9"> 
                              <input required type="email" class="form-control input-sm" name="email" placeholder="e-mail">
                              </div>  
                            </div>


                            <div class="form-group">
                              <label class="control-label col-sm-3" for="pwd" style="margin-top: -20px;"><h3>Contraseña:</h3></label>
                              <div class="col-sm-9"> 
                              <input type="password" class="form-control input-sm" name="password" required placeholder="Ingrese su contraseña">
                              </div>  
                            </div>           

                            <!--<div class="form-group">
                            <label class="control-label col-sm-3" for="fecha"><h5>Fecha de Nacimiento:</h5></label><br>
                            <div class="col-sm-9"> 
                              <g:datePicker id="fecha" name="fecha" class="button" precision="day"/>  
                              </div>  
                            </div>  -->              

                            <g:submitButton type="submit" class="button btn-submit" name="submitButton" value="Registrarme!" />     

                          </g:form>                    
                                            
                    </div>
                    <img src="images/home/slider/hill.png" class="slider-hill" style="height: 100% !important;">
                    
                </div>
            </div>
        </div>
        
    </section>


<!--
<section id="services">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 300ms; animation-name: fadeIn;">
        <div class="single-service">
          <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: scaleIn;">
            <img src="images/home/routes.png" alt="">
          </div>
          <h2>Arma tus propias Rutas</h2>
          <p>Puedes crear rutas presonalizadas y publicarlas a tus maigos para facilitar la visualización de tus eventos.</p>
        </div>
      </div>
      <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 600ms; animation-name: fadeIn;">
        <div class="single-service">
          <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 600ms; animation-name: scaleIn;">
            <img src="images/home/Bicycle-PNG-7.png" alt="">
          </div>
          <h2>Rueda</h2>
          <p>Con bikeapp puedes organizar eventos masivos con tus amigos en los que podras conocer gente increíble que comparta contigo la pasion por las bicis.</p>
        </div>
      </div>
      <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="900ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 900ms; animation-name: fadeIn;">
        <div class="single-service">
          <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="900ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 900ms; animation-name: scaleIn;">
            <img src="images/home/hipchat.png" alt="">
          </div>
          <h2>Expresate</h2>
          <p>Crea un grupo de de ciclistas y comparte con tus amigos tus opiniones experiencias, fotos y mucho mas</p>
        </div>
      </div>
    </div>
  </div>
</section>



        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="testimonial bottom">
                        <h2>Testimonial</h2>

                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="images/home/profile2.png" alt=""></a>
                            </div>
                            <div class="media-body">
                                <blockquote>Antes no podia si quiera subirme a una bici. Gracias BikeApp <3</blockquote>
                                <h3><a href="">- David Dager</a></h3>
                            </div>
                        </div>   
                    </div> 
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="contact-info bottom">
                        <h2>Info de Contacto</h2>
                        <address>
                        E-mail: <a href="bikeappteam@gmail.com">bikeappteam@gmail.com</a> <br> 
                        Teléfono: (+57) 456 7890 <br> 
                        Fax:  (1+57) 456 7891 <br> 
                        </address>

                        <h2>Dirección</h2>
                        <address>
                        Calle 45 No 26-52<br> 
                        Universidad Nacional de Colombia, <br> 
                        Bogota D.C. <br> 
                        </address>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                     <h2>Contactenos</h2>
                     <div class="form-group">
                       <input type="text" name="nombre" id="nombre" class="form-control" required="required" placeholder="Nombre">
                     </div>
                     <div class="form-group">
                       <input type="email" name="email" id="email" class="form-control" required="required" placeholder="Email">
                     </div>
                     <div class="form-group">
                       <textarea name="message" id="mensaje" required="required" class="form-control" rows="8" placeholder="Sugerencia"></textarea>
                     </div>                        
                     <div class="form-group">
                       <input type="submit" name="submit" class="btn btn-submit" value="Enviar" onclick="enviarSugerencia()" />
                     </div>
                   </div>
                </div>

            </div>
        </div>-->


</body>
</html>
