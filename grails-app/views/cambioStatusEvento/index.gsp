
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.log.CambioStatusEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioStatusEvento.label', default: 'CambioStatusEvento')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Estatus "Evento"</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-cambioStatusEvento" class="content scaffold-list"
					role="main">
					<h1>
						Gestión Estatus "Evento"
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
                	<h3 class="panel-title">Lista de institutos</h3>
				</div>
	

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="estatusStatus" title="${message(code: 'cambioStatusEvento.estatusStatus.label', default: 'Estatus Status')}" />
					
						<g:sortableColumn property="comentarios" title="${message(code: 'cambioStatusEvento.comentarios.label', default: 'Comentarios')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'cambioStatusEvento.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="cambioStatusEvento.evento.label" default="Evento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cambioStatusEventoInstanceList}" status="i" var="cambioStatusEventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cambioStatusEventoInstance.id}">${fieldValue(bean: cambioStatusEventoInstance, field: "estatusStatus")}</g:link></td>
					
						<td>${fieldValue(bean: cambioStatusEventoInstance, field: "comentarios")}</td>
					
						<td><g:formatDate date="${cambioStatusEventoInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: cambioStatusEventoInstance, field: "evento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${cambioStatusEventoInstanceCount ?: 0}" />
			</div>

	</body>
</html>
