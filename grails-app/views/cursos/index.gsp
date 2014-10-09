
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear curso</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-cursos" class="content scaffold-list" role="main">
					<h1>
						Gestión de Cursos
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
					
						<g:sortableColumn property="nombreDelCurso" title="${message(code: 'cursos.nombreDelCurso.label', default: 'Nombre Del Curso')}" />
					
						<g:sortableColumn property="siglas" title="${message(code: 'cursos.siglas.label', default: 'Siglas')}" />
					
						<g:sortableColumn property="objetivoDelCurso" title="${message(code: 'cursos.objetivoDelCurso.label', default: 'Objetivo Del Curso')}" />
					
						<g:sortableColumn property="duracionEnHoras" title="${message(code: 'cursos.duracionEnHoras.label', default: 'Duracion En Horas')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'cursos.observaciones.label', default: 'Observaciones')}" />
					
						<g:sortableColumn property="nombreCoordinador" title="${message(code: 'cursos.nombreCoordinador.label', default: 'Nombre Coordinador')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cursosInstanceList}" status="i" var="cursosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cursosInstance.id}">${fieldValue(bean: cursosInstance, field: "nombreDelCurso")}</g:link></td>
					
						<td>${fieldValue(bean: cursosInstance, field: "siglas")}</td>
					
						<td>${fieldValue(bean: cursosInstance, field: "objetivoDelCurso")}</td>
					
						<td>${fieldValue(bean: cursosInstance, field: "duracionEnHoras")}</td>
					
						<td>${fieldValue(bean: cursosInstance, field: "observaciones")}</td>
					
						<td>${fieldValue(bean: cursosInstance, field: "nombreCoordinador")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${cursosInstanceCount ?: 0}" />
			</div>
	
	</body>
</html>
