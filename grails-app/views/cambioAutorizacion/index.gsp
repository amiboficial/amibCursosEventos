
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.log.CambioAutorizacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Estatus "Instituto"</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-cambioAutorizacion" class="content scaffold-list"
					role="main">
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
                	<h3 class="panel-title">Lista de estatus</h3>
				</div>

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="estatusAutorizacion" title="${message(code: 'cambioAutorizacion.estatusAutorizacion.label', default: 'Estatus Autorizacion')}" />
					
						<g:sortableColumn property="comentarios" title="${message(code: 'cambioAutorizacion.comentarios.label', default: 'Comentarios')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'cambioAutorizacion.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="cambioAutorizacion.instituto.label" default="Instituto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cambioAutorizacionInstanceList}" status="i" var="cambioAutorizacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cambioAutorizacionInstance.id}">${fieldValue(bean: cambioAutorizacionInstance, field: "estatusAutorizacion")}</g:link></td>
					
						<td>${fieldValue(bean: cambioAutorizacionInstance, field: "comentarios")}</td>
					
						<td><g:formatDate date="${cambioAutorizacionInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: cambioAutorizacionInstance, field: "instituto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${cambioAutorizacionInstanceCount ?: 0}" />
			</div>

	</body>
</html>
