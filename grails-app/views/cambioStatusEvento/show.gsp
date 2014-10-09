
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.log.CambioStatusEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioStatusEvento.label', default: 'CambioStatusEvento')}" />
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
				
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de cambios de Estatus de Evento</g:link></li>
				
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-cambioStatusEvento" class="content scaffold-show"
						role="main">
						<h1>
							Muestra cambios de Estatus de Evento
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

			<ul class="property-list cambioStatusEvento">

				<g:if test="${cambioStatusEventoInstance?.estatusStatus}">
					<li class="fieldcontain"><span id="estatusStatus-label"
						class="property-label"><g:message
								code="cambioStatusEvento.estatusStatus.label"
								default="Estatus Status" /></span> <span class="property-value"
						aria-labelledby="estatusStatus-label"><g:fieldValue
								bean="${cambioStatusEventoInstance}" field="estatusStatus" /></span></li>
				</g:if>

				<g:if test="${cambioStatusEventoInstance?.comentarios}">
					<li class="fieldcontain"><span id="comentarios-label"
						class="property-label"><g:message
								code="cambioStatusEvento.comentarios.label"
								default="Comentarios" /></span> <span class="property-value"
						aria-labelledby="comentarios-label"><g:fieldValue
								bean="${cambioStatusEventoInstance}" field="comentarios" /></span></li>
				</g:if>

				<g:if test="${cambioStatusEventoInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="cambioStatusEvento.fechaCreacion.label"
								default="Fecha Creacion" /></span> <span class="property-value"
						aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${cambioStatusEventoInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${cambioStatusEventoInstance?.evento}">
					<li class="fieldcontain"><span id="evento-label"
						class="property-label"><g:message
								code="cambioStatusEvento.evento.label" default="Evento" /></span> <span
						class="property-value" aria-labelledby="evento-label"><g:link
								controller="evento" action="show"
								id="${cambioStatusEventoInstance?.evento?.id}">
								${cambioStatusEventoInstance?.evento?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:cambioStatusEventoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack"
						action="edit" resource="${cambioStatusEventoInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					&nbsp;
					<g:actionSubmit
						class="delete btn btn-primary colortitle colorblack"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack"
						action="index">Regresar</g:link>
					</li>
				</fieldset>
				<br>
			</g:form>
		</div>
</body>
</html>
