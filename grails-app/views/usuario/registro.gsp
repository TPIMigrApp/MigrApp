<!DOCTYPE html>
	<asset:stylesheet href="bikeApp.css"/>
	<html>
	    <head>  
	    	<meta name="layout" content="main"/>		
  			
  		</head>
	    <body>	  	
	    	<div class="page-header">
			  <h1><center>Intereses de ${username} </center> </h1>
			</div>
	        
	        
	        <div class="container" style="margin-top:10px">
		        
		        <div class="panel panel-default" style="background-color: rgba(245, 245, 245, 0.4)">
		        	<div class="panel-heading">
		        	 	Formulario de registro de intereses 
		        	</div>
		        	<div class="panel-body">
		        		<g:form role="form" action="intereses" method="post" controller="usuario">
				        	<div class="form-group">	
				        		<g:hiddenField name="username" value="${username}"/>			        		
				        		<label>Si desea puede agregar uno o varios intereses a su usuario</label>
				        		<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Ofertas "> Ofertas</label>
								</div>
								<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Ciclopaseos"> Ciclopaseos</label>
								</div>
								<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Actualidad y ciclismo"> Actualidad y ciclismo</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Soluciones de movilidad"> Soluciones de movilidad</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Seguridad Vial"> Seguridad Vial</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Ciclomontanismo"> Ciclomontañismo</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Informacion ciclorutas"> Información ciclorutas</label>
								</div>
						     
						    </div>

				        		
							  
							<input type="submit" value="Aceptar" class="btn btn-primary btn-lg">
						</g:form>


		        	</div>       	
		        	
		        </div>	

	        </div>
	    </body>
	</html>