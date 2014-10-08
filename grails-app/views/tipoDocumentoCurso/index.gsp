
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDocumentoCurso.label', default: 'TipoDocumentoCurso')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear tipo de documento "Curso"</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-tipoDocumentoCurso" class="content scaffold-list"
					role="main">
					<h1>
						Gestión tipo de docuemnto"Curso"
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
                	<h3 class="panel-title">Lista de documentos</h3>
				</div>

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="tipoDoumentoCurso" title="${message(code: 'tipoDocumentoCurso.tipoDoumentoCurso.label', default: 'Tipo Doumento Curso')}" />
					
						<g:sortableColumn property="clave" title="${message(code: 'tipoDocumentoCurso.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="estatus" title="${message(code: 'tipoDocumentoCurso.estatus.label', default: 'Estatus')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoDocumentoCursoInstanceList}" status="i" var="tipoDocumentoCursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoDocumentoCursoInstance.id}">${fieldValue(bean: tipoDocumentoCursoInstance, field: "tipoDoumentoCurso")}</g:link></td>
					
						<td>${fieldValue(bean: tipoDocumentoCursoInstance, field: "clave")}</td>
					
						<td><g:formatBoolean boolean="${tipoDocumentoCursoInstance.estatus}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${tipoDocumentoCursoInstanceCount ?: 0}" />
			</div>
	
	</body>
</html>
