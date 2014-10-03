
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentoCursos.label', default: 'DocumentoCursos')}" />
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
				<!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear documento</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-documentoCursos" class="content scaffold-list"
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
                	<h3 class="panel-title">Lista de documentos</h3>
				</div>

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="documentos" title="${message(code: 'documentoCursos.documentos.label', default: 'Documentos')}" />
					
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'documentoCursos.fechaCreacion.label', default: 'Fecha Creacion')}" />
					
						<th><g:message code="documentoCursos.curso.label" default="Curso" /></th>
					
						<th><g:message code="documentoCursos.tipoDocumentoCurso.label" default="Tipo Documento Curso" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentoCursosInstanceList}" status="i" var="documentoCursosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${documentoCursosInstance.id}">${fieldValue(bean: documentoCursosInstance, field: "documentos")}</g:link></td>
					
						<td><g:formatDate date="${documentoCursosInstance.fechaCreacion}" /></td>
					
						<td>${fieldValue(bean: documentoCursosInstance, field: "curso")}</td>
					
						<td>${fieldValue(bean: documentoCursosInstance, field: "tipoDocumentoCurso")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${documentoCursosInstanceCount ?: 0}" />
			</div>

		
	</body>
</html>
