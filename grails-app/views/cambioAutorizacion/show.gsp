
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.log.CambioAutorizacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion')}" />
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión Estatus "Instituto"</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-cambioAutorizacion" class="content scaffold-show"
						role="main">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
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

			<ul class="property-list cambioAutorizacion">

				<g:if test="${cambioAutorizacionInstance?.estatusAutorizacion}">
					<li class="fieldcontain"><span id="estatusAutorizacion-label"
						class="property-label"><g:message
								code="cambioAutorizacion.estatusAutorizacion.label"
								default="Estatus Autorizacion" /></span> <span class="property-value"
						aria-labelledby="estatusAutorizacion-label"><g:fieldValue
								bean="${cambioAutorizacionInstance}" field="estatusAutorizacion" /></span>

					</li>
				</g:if>

				<g:if test="${cambioAutorizacionInstance?.comentarios}">
					<li class="fieldcontain"><span id="comentarios-label"
						class="property-label"><g:message
								code="cambioAutorizacion.comentarios.label"
								default="Comentarios" /></span> <span class="property-value"
						aria-labelledby="comentarios-label"><g:fieldValue
								bean="${cambioAutorizacionInstance}" field="comentarios" /></span></li>
				</g:if>

				<g:if test="${cambioAutorizacionInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="cambioAutorizacion.fechaCreacion.label"
								default="Fecha Creacion" /></span> <span class="property-value"
						aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${cambioAutorizacionInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${cambioAutorizacionInstance?.instituto}">
					<li class="fieldcontain"><span id="instituto-label"
						class="property-label"><g:message
								code="cambioAutorizacion.instituto.label" default="Instituto" /></span>

						<span class="property-value" aria-labelledby="instituto-label"><g:link
								controller="instituto" action="show"
								id="${cambioAutorizacionInstance?.instituto?.id}">
								${cambioAutorizacionInstance?.instituto?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:cambioAutorizacionInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${cambioAutorizacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
</body>
</html>
