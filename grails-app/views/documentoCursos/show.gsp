
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentoCursos.label', default: 'DocumentoCursos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
			<ul class="nav navbar-nav navbar-center">
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>  -->
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión documento</g:link></li>
				
			</ul>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-documentoCursos" class="content scaffold-show"
						role="main">
						<h1>Muestra documento</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>
			<br>

			<ul class="property-list documentoCursos">

				<g:if test="${documentoCursosInstance?.documentos}">
					<li class="fieldcontain"><span id="documentos-label"
						class="property-label"><g:message
								code="documentoCursos.documentos.label" default="Documentos" /></span>

						<span class="property-value" aria-labelledby="documentos-label"><g:fieldValue
								bean="${documentoCursosInstance}" field="documentos" /></span></li>
				</g:if>

				<g:if test="${documentoCursosInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="documentoCursos.fechaCreacion.label"
								default="Fecha Creacion" /></span> <span class="property-value"
						aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${documentoCursosInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${documentoCursosInstance?.curso}">
					<li class="fieldcontain"><span id="curso-label"
						class="property-label"><g:message
								code="documentoCursos.curso.label" default="Curso" /></span> <span
						class="property-value" aria-labelledby="curso-label"><g:link
								controller="cursos" action="show"
								id="${documentoCursosInstance?.curso?.id}">
								${documentoCursosInstance?.curso?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${documentoCursosInstance?.tipoDocumentoCurso}">
					<li class="fieldcontain"><span id="tipoDocumentoCurso-label"
						class="property-label"><g:message
								code="documentoCursos.tipoDocumentoCurso.label"
								default="Tipo Documento Curso" /></span> <span class="property-value"
						aria-labelledby="tipoDocumentoCurso-label"><g:link
								controller="tipoDocumentoCurso" action="show"
								id="${documentoCursosInstance?.tipoDocumentoCurso?.id}">
								${documentoCursosInstance?.tipoDocumentoCurso?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:documentoCursosInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${documentoCursosInstance}"><g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
</body>
</html>
