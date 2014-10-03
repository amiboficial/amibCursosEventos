
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Expositor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'expositor.label', default: 'Expositor')}" />
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
				
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión expositor</g:link></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear expositor</g:link></li>
			</ul>
			<br>
		</div>
		</fieldset>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-expositor" class="content scaffold-show" role="main">
						<h1>
							Muestra expositor
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


			<ul class="property-list expositor">

				<g:if test="${expositorInstance?.nombreExpositor}">
					<li class="fieldcontain"><span id="nombreExpositor-label"
						class="property-label"><g:message
								code="expositor.nombreExpositor.label"
								default="Nombre Expositor" /></span> <span class="property-value"
						aria-labelledby="nombreExpositor-label"><g:fieldValue
								bean="${expositorInstance}" field="nombreExpositor" /></span></li>
				</g:if>

				<g:if test="${expositorInstance?.primerApellidoExpositor}">
					<li class="fieldcontain"><span
						id="primerApellidoExpositor-label" class="property-label"><g:message
								code="expositor.primerApellidoExpositor.label"
								default="Primer Apellido Expositor" /></span> <span
						class="property-value"
						aria-labelledby="primerApellidoExpositor-label"><g:fieldValue
								bean="${expositorInstance}" field="primerApellidoExpositor" /></span></li>
				</g:if>

				<g:if test="${expositorInstance?.segundoApellidoExpositor}">
					<li class="fieldcontain"><span
						id="segundoApellidoExpositor-label" class="property-label"><g:message
								code="expositor.segundoApellidoExpositor.label"
								default="Segundo Apellido Expositor" /></span> <span
						class="property-value"
						aria-labelledby="segundoApellidoExpositor-label"><g:fieldValue
								bean="${expositorInstance}" field="segundoApellidoExpositor" /></span>

					</li>
				</g:if>

				<g:if test="${expositorInstance?.horas}">
					<li class="fieldcontain"><span id="horas-label"
						class="property-label"><g:message
								code="expositor.horas.label" default="Horas" /></span> <span
						class="property-value" aria-labelledby="horas-label"><g:fieldValue
								bean="${expositorInstance}" field="horas" /></span></li>
				</g:if>

				<g:if test="${expositorInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="expositor.fechaCreacion.label" default="Fecha Creacion" /></span>

						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${expositorInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${expositorInstance?.curso}">
					<li class="fieldcontain"><span id="curso-label"
						class="property-label"><g:message
								code="expositor.curso.label" default="Curso" /></span> <span
						class="property-value" aria-labelledby="curso-label"><g:link
								controller="cursos" action="show"
								id="${expositorInstance?.curso?.id}">
								${expositorInstance?.curso?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${expositorInstance?.duracionHoras}">
					<li class="fieldcontain"><span id="duracionHoras-label"
						class="property-label"><g:message
								code="expositor.duracionHoras.label" default="Duracion Horas" /></span>

						<span class="property-value" aria-labelledby="duracionHoras-label"><g:fieldValue
								bean="${expositorInstance}" field="duracionHoras" /></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:expositorInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${expositorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
