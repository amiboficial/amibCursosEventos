
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentoEvento.label', default: 'DocumentoEvento')}" />
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
				
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index"> Gestión de Documentos de Evento</g:link></li>
				
			</ul><br>
		</div>

		<fieldset>
			<div class="panel panel-default col-lg-12">
				<div class="panel-heading">
					<div class="widgetTitle">
						<div id="show-documentoEvento" class="content scaffold-show"
							role="main">
							<h1>
								Muestra Documentos de Evento
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

				<ul class="property-list documentoEvento">

					<g:if test="${documentoEventoInstance?.documentos}">
						<li class="fieldcontain"><span id="documentos-label"
							class="property-label"><g:message
									code="documentoEvento.documentos.label" default="Documentos" /></span>

							<span class="property-value" aria-labelledby="documentos-label"><g:fieldValue
									bean="${documentoEventoInstance}" field="documentos" /></span></li>
					</g:if>

					<g:if test="${documentoEventoInstance?.fechaCreacion}">
						<li class="fieldcontain"><span id="fechaCreacion-label"
							class="property-label"><g:message
									code="documentoEvento.fechaCreacion.label"
									default="Fecha Creacion" /></span> <span class="property-value"
							aria-labelledby="fechaCreacion-label"><g:formatDate
									date="${documentoEventoInstance?.fechaCreacion}" /></span></li>
					</g:if>

					<g:if test="${documentoEventoInstance?.evento}">
						<li class="fieldcontain"><span id="evento-label"
							class="property-label"><g:message
									code="documentoEvento.evento.label" default="Evento" /></span> <span
							class="property-value" aria-labelledby="evento-label"><g:link
									controller="evento" action="show"
									id="${documentoEventoInstance?.evento?.id}">
									${documentoEventoInstance?.evento?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

					<g:if test="${documentoEventoInstance?.tipoDocumentoEvento}">
						<li class="fieldcontain"><span id="tipoDocumentoEvento-label"
							class="property-label"><g:message
									code="documentoEvento.tipoDocumentoEvento.label"
									default="Tipo Documento Evento" /></span> <span
							class="property-value"
							aria-labelledby="tipoDocumentoEvento-label"><g:link
									controller="tipoDocumentoEvento" action="show"
									id="${documentoEventoInstance?.tipoDocumentoEvento?.id}">
									${documentoEventoInstance?.tipoDocumentoEvento?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>

				</ul>
				<g:form url="[resource:documentoEventoInstance, action:'delete']"
					method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${documentoEventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
