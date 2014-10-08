
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDocumentoCurso.label', default: 'TipoDocumentoCurso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav navbar-center">
	
				<li><g:link class="list" action="index">Gestio tipo de documento "Curso"</g:link></li>

			</ul>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">

					<div id="show-tipoDocumentoCurso" class="content scaffold-show"
						role="main">
						<h1>
							Mostrar Tipo Documento Curso
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>
			<br>

			<ul class="property-list tipoDocumentoCurso">

				<g:if test="${tipoDocumentoCursoInstance?.tipoDoumentoCurso}">
					<li class="fieldcontain"><span id="tipoDoumentoCurso-label"
						class="property-label"><g:message
								code="tipoDocumentoCurso.tipoDoumentoCurso.label"
								default="Tipo Doumento Curso" /></span> <span class="property-value"
						aria-labelledby="tipoDoumentoCurso-label"><g:fieldValue
								bean="${tipoDocumentoCursoInstance}" field="tipoDoumentoCurso" /></span>

					</li>
				</g:if>

				<g:if test="${tipoDocumentoCursoInstance?.clave}">
					<li class="fieldcontain"><span id="clave-label"
						class="property-label"><g:message
								code="tipoDocumentoCurso.clave.label" default="Clave" /></span> <span
						class="property-value" aria-labelledby="clave-label"><g:fieldValue
								bean="${tipoDocumentoCursoInstance}" field="clave" /></span></li>
				</g:if>

				<g:if test="${tipoDocumentoCursoInstance?.documentoCurso}">
					<li class="fieldcontain"><span id="documentoCurso-label"
						class="property-label"><g:message
								code="tipoDocumentoCurso.documentoCurso.label"
								default="Documento Curso" /></span> <g:each
							in="${tipoDocumentoCursoInstance.documentoCurso}" var="d">
							<span class="property-value"
								aria-labelledby="documentoCurso-label"><g:link
									controller="documentoCursos" action="show" id="${d.id}">
									${d?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${tipoDocumentoCursoInstance?.estatus}">
					<li class="fieldcontain"><span id="estatus-label"
						class="property-label"><g:message
								code="tipoDocumentoCurso.estatus.label" default="Estatus" /></span> <span
						class="property-value" aria-labelledby="estatus-label"><g:formatBoolean
								boolean="${tipoDocumentoCursoInstance?.estatus}" /></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:tipoDocumentoCursoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${tipoDocumentoCursoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
</body>
</html>
