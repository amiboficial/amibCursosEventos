
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDocumentoEvento.label', default: 'TipoDocumentoEvento')}" />
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Tipos de Documento de Evento</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-tipoDocumentoEvento" class="content scaffold-show"
						role="main">
						<h1>
						Muestra Tipos de Documento de Evento
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

			<ul class="property-list tipoDocumentoEvento">

				<g:if test="${tipoDocumentoEventoInstance?.tipoDoumentoEvento}">
					<li class="fieldcontain"><span id="tipoDoumentoEvento-label"
						class="property-label"><g:message
								code="tipoDocumentoEvento.tipoDoumentoEvento.label"
								default="Tipo Doumento Evento" /></span> <span class="property-value"
						aria-labelledby="tipoDoumentoEvento-label"><g:fieldValue
								bean="${tipoDocumentoEventoInstance}" field="tipoDoumentoEvento" /></span>

					</li>
				</g:if>

				<g:if test="${tipoDocumentoEventoInstance?.clave}">
					<li class="fieldcontain"><span id="clave-label"
						class="property-label"><g:message
								code="tipoDocumentoEvento.clave.label" default="Clave" /></span> <span
						class="property-value" aria-labelledby="clave-label"><g:fieldValue
								bean="${tipoDocumentoEventoInstance}" field="clave" /></span></li>
				</g:if>

				<g:if test="${tipoDocumentoEventoInstance?.documentoEvento}">
					<li class="fieldcontain"><span id="documentoEvento-label"
						class="property-label"><g:message
								code="tipoDocumentoEvento.documentoEvento.label"
								default="Documento Evento" /></span> <g:each
							in="${tipoDocumentoEventoInstance.documentoEvento}" var="d">
							<span class="property-value"
								aria-labelledby="documentoEvento-label"><g:link
									controller="documentoEvento" action="show" id="${d.id}">
									${d?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${tipoDocumentoEventoInstance?.estatus}">
					<li class="fieldcontain"><span id="estatus-label"
						class="property-label"><g:message
								code="tipoDocumentoEvento.estatus.label" default="Estatus" /></span> <span
						class="property-value" aria-labelledby="estatus-label"><g:formatBoolean
								boolean="${tipoDocumentoEventoInstance?.estatus}" /></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:tipoDocumentoEventoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${tipoDocumentoEventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete"value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset> <br>
			</g:form>
		</div>
</body>
</html>
