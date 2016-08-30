<div id="modalCrearGrupo" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Nuevo Grupo</h4>
				</div>
				<g:form url="[resource:grupoInstance,controller:'grupo', action:'save']"  enctype="multipart/form-data" role="form">
				<div class="modal-body">

					<div class="form-group">
						<label for="nombre">Nombre del grupo:</label>
						<g:textField required="true" name="nombre" class="form-control " placeholder="Nombre"/>					  
					</div>
					
					<div class="form-group">
						<label for="descripcion">Descripción del grupo:</label>
						<g:textArea required="true" name="descripcion" class="form-control " placeholder="Descripción" />					  
					</div>

					<div class="form-group">
						<label for="tags">Tags:</label>
						<g:textArea required="true" name="tags" class="form-control " placeholder="Tags (separados por comas ',' )"/>					  
					</div>


					

					
				</div>
				<div class="modal-footer">
					<g:submitButton name="create" class="btn btn-submit" value="Crear" id="create" />									
				</div>
			</g:form>
		</div>

	</div>
