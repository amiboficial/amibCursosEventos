
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Expositor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'expositor.label', default: 'Expositor')}" />
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
				<div id="list-expositor" class="content scaffold-list" role="main">
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
                	<h3 class="panel-title">Lista de expositores</h3>
				</div>

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="nombreExpositor" title="${message(code: 'expositor.nombreExpositor.label', default: 'Nombre Expositor')}" />
					
						<g:sortableColumn property="primerApellidoExpositor" title="${message(code: 'expositor.primerApellidoExpositor.label', default: 'Primer Apellido Expositor')}" />
					
						<g:sortableColumn property="segundoApellidoExpositor" title="${message(code: 'expositor.segundoApellidoExpositor.label', default: 'Segundo Apellido Expositor')}" />
					
						<g:sortableColumn property="horas" title="${message(code: 'expositor.horas.label', default: 'Horas')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'expositor.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="expositor.curso.label" default="Curso" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${expositorInstanceList}" status="i" var="expositorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${expositorInstance.id}">${fieldValue(bean: expositorInstance, field: "nombreExpositor")}</g:link></td>
					
						<td>${fieldValue(bean: expositorInstance, field: "primerApellidoExpositor")}</td>
					
						<td>${fieldValue(bean: expositorInstance, field: "segundoApellidoExpositor")}</td>
					
						<td>${fieldValue(bean: expositorInstance, field: "horas")}</td>
					
						<td><g:formatDate date="${expositorInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: expositorInstance, field: "curso")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${expositorInstanceCount ?: 0}" />
			</div>
		
	</body>
</html>
