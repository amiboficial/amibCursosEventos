<%@ page contentType="text/html;charset=UTF-8" %>
		<script type="text/template" id="expositorTemplate">
			<td>{{=nombreExpositor}}</td>
						<td>{{=primerApellidoExpositor}}</td>
						<td>{{=segundoApellidoExpositor}}</td>
						<td>{{=horas}}</td>

						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="expositor" value="{ 'id':{{=grailsId}}, 'nombreExpositor' : {{=nombreExpositor}}, 'primerApellidoExpositor' : {{=primerApellidoExpositor}}, 
							 'segundoApellidoExpositor' : {{=segundoApellidoExpositor}}, 'horas' : {{=horas}} } " />
						</td>

		</script>
		
		 <script type="text/template" id="newExpositorTemplate">
			<tr>
				<td><input id="txtNewNomExpositor" class="newNombreExpositor form-control" type="text"/></td>
				<td><input id="txtNewPriApeExpositor" class="newPrimerApellidoExpositor form-control" type="text"/></td>
				<td><input id="txtNewSegApeExpositor" class="newSegundoApellidoExpositor form-control" type="text"/></td>
				<td><input id="NumNewhora" class="newHoras form-control" type="number"/></td>
				<td><button id="btnAddNewExpositor" class="add btn btn-success btn-sm" disabled><span class="glyphicon glyphicon-plus"></span><span class="hidden-xs hidden-sm"> Agregar</span></button></td>
			</tr>
		</script> 