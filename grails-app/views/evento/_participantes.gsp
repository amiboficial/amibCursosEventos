<%@ page contentType="text/html;charset=UTF-8" %>
		<script type="text/template" id="participanteTemplate">
			<td>{{=matricula}}</td>
			<td>{{=nombreParticipante}}</td>
			<td>
				<button class="delete btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span><span class="hidden-xs hidden-sm">  Borrar</span></button> 
				<input type="hidden" name="participante" value="{ id:{{=grailsId}}, matricula:{{=matricula}}, nombreParticipante:'{{=nombreParticipante}}' }" />
			</td>
		</script>
		<script type="text/template" id="newParticipanteTemplate">
			<tr>
				<td><input id="txtParticipantesNewMatricula" class="newMatricula form-control" type="text" /></td>
				<td><input id="txtParticipantesNewNombre" class="newNombre form-control" type="text" disabled/></td>
				<td><button id="btnParticipantesAdd" class="add btn btn-success btn-sm" disabled><span class="glyphicon glyphicon-plus"></span><span class="hidden-xs hidden-sm"> Agregar</span></button></td>
			</tr>
		</script>