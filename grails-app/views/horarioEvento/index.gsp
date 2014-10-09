
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.HorarioEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horarioEvento.label', default: 'HorarioEvento')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Horario de Eventos</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-horarioEvento" class="content scaffold-list"
					role="main">
					<h1>
					Gestión de Horarios de Eventos
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
                	<h3 class="panel-title">Lista de horario</h3>
				</div>


	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="fechaDia" title="${message(code: 'horarioEvento.fechaDia.label', default: 'Fecha Dia')}" />
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'horarioEvento.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="horafin" title="${message(code: 'horarioEvento.horafin.label', default: 'Horafin')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'horarioEvento.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="horarioEvento.evento.label" default="Evento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${horarioEventoInstanceList}" status="i" var="horarioEventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${horarioEventoInstance.id}">${fieldValue(bean: horarioEventoInstance, field: "fechaDia")}</g:link></td>
					
						<td>${fieldValue(bean: horarioEventoInstance, field: "horaInicio")}</td>
					
						<td>${fieldValue(bean: horarioEventoInstance, field: "horafin")}</td>
					
						<td><g:formatDate date="${horarioEventoInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: horarioEventoInstance, field: "evento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${horarioEventoInstanceCount ?: 0}" />
			</div>
	
	</body>
</html>
