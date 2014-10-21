
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoCurso.label', default: 'TipoCurso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="navigation">
				
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Tipos de Curso</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-tipoCurso" class="content scaffold-list" role="main">
					<h1>
						Gestión de Tipo de Curso
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
                	<h3 class="panel-title">Lista tipo Curso</h3>
				</div>
				
	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
						<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoCurso.descripcion.label', default: 'Descripcion')}" />
											
						<g:sortableColumn property="vigente" title="${message(code: 'tipoCurso.vigente.label', default: 'Vigente')}" />
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoCursoInstanceList}" status="i" var="tipoCursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
						<td><g:link action="show" id="${tipoCursoInstance.id}">${fieldValue(bean: tipoCursoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoCursoInstance, field: "vigente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
				</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${tipoCursoInstanceCount ?: 0}" />
			</div>
	
	</body>
</html>
