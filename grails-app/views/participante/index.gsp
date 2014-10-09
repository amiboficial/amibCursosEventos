
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Participante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" type="text/css"
		href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
		<script type="text/javascript" charset="utf8"
		src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

		<g:javascript src="dataTableFormat.js" />	
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="navigation">
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Participantes</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-participante" class="content scaffold-list"
					role="main">
					<h1>
						Gestión de Participantes
					</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset>
			<div class="panel panel-default">
            	<div class="panel-heading">
                	<h3 class="panel-title">Lista de cursos</h3>
				</div>
	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="matricula" title="${message(code: 'participante.matricula.label', default: 'Matricula')}" />
					
						<g:sortableColumn property="nombreParticipante" title="${message(code: 'participante.nombreParticipante.label', default: 'Nombre Participante')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'participante.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<g:sortableColumn property="fechaModificacion" title="${message(code: 'participante.fechaModificacion.label', default: 'Fecha Modificacion')}" />
					
						<th><g:message code="participante.evento.label" default="Evento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${participanteInstanceList}" status="i" var="participanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${participanteInstance.id}">${fieldValue(bean: participanteInstance, field: "matricula")}</g:link></td>
					
						<td>${fieldValue(bean: participanteInstance, field: "nombreParticipante")}</td>
					
						<td><g:formatDate date="${participanteInstance.fechaCreacion}" /></td>
					
						<td><g:formatDate date="${participanteInstance.fechaModificacion}" /></td>
					
						<td>${fieldValue(bean: participanteInstance, field: "evento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${participanteInstanceCount ?: 0}" />
			</div>
	
	</body>
</html>
