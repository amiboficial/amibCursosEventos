
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-evento" class="content scaffold-list" role="main">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
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
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'evento.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="fechaTermino" title="${message(code: 'evento.fechaTermino.label', default: 'Fecha Termino')}" />
					
						<g:sortableColumn property="nombreCordinador" title="${message(code: 'evento.nombreCordinador.label', default: 'Nombre Cordinador')}" />
					
						<g:sortableColumn property="primerApellidoCoordinador" title="${message(code: 'evento.primerApellidoCoordinador.label', default: 'Primer Apellido Coordinador')}" />
					
						<g:sortableColumn property="segundoApellidoCoordinador" title="${message(code: 'evento.segundoApellidoCoordinador.label', default: 'Segundo Apellido Coordinador')}" />
					
						<g:sortableColumn property="telefonoFijoCoordinador" title="${message(code: 'evento.telefonoFijoCoordinador.label', default: 'Telefono Fijo Coordinador')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "fechaInicio")}</g:link></td>
					
						<td><g:formatDate date="${eventoInstance.fechaTermino}" /></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "nombreCordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "primerApellidoCoordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "segundoApellidoCoordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "telefonoFijoCoordinador")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${eventoInstanceCount ?: 0}" />
			</div>

	</body>
</html>
