
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDocumentoEvento.label', default: 'TipoDocumentoEvento')}" />
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
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear de Tipos de Documento de Evento</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-tipoDocumentoEvento" class="content scaffold-list"
					role="main">
					<h1>
						Gestión de Tipos de Documento de Evento
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
                	<h3 class="panel-title">Lista de tipo de documentos</h3>
				</div>
	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="tipoDoumentoEvento" title="${message(code: 'tipoDocumentoEvento.tipoDoumentoEvento.label', default: 'Tipo Doumento Evento')}" />
					
						<g:sortableColumn property="clave" title="${message(code: 'tipoDocumentoEvento.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="estatus" title="${message(code: 'tipoDocumentoEvento.estatus.label', default: 'Estatus')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoDocumentoEventoInstanceList}" status="i" var="tipoDocumentoEventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoDocumentoEventoInstance.id}">${fieldValue(bean: tipoDocumentoEventoInstance, field: "tipoDoumentoEvento")}</g:link></td>
					
						<td>${fieldValue(bean: tipoDocumentoEventoInstance, field: "clave")}</td>
					
						<td><g:formatBoolean boolean="${tipoDocumentoEventoInstance.estatus}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${tipoDocumentoEventoInstanceCount ?: 0}" />
			</div>

	</body>
</html>
