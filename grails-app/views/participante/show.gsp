
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Participante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
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
				<!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="list" action="index">Gestión participante</g:link></li>
			</ul> <br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-participante" class="content scaffold-show"
						role="main">
						<h1>
								Editar participante
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
			<ul class="property-list participante">

				<g:if test="${participanteInstance?.nombreParticipante}">
					<li class="fieldcontain"><span id="nombreParticipante-label"
						class="property-label"><g:message
								code="participante.nombreParticipante.label"
								default="Nombre Participante" /></span> <span class="property-value"
						aria-labelledby="nombreParticipante-label"><g:fieldValue
								bean="${participanteInstance}" field="nombreParticipante" /></span></li>
				</g:if>

				<g:if test="${participanteInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="participante.fechaCreacion.label" default="Fecha Creacion" /></span>

						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${participanteInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${participanteInstance?.fechaModificacion}">
					<li class="fieldcontain"><span id="fechaModificacion-label"
						class="property-label"><g:message
								code="participante.fechaModificacion.label"
								default="Fecha Modificacion" /></span> <span class="property-value"
						aria-labelledby="fechaModificacion-label"><g:formatDate
								date="${participanteInstance?.fechaModificacion}" /></span></li>
				</g:if>

				<g:if test="${participanteInstance?.evento}">
					<li class="fieldcontain"><span id="evento-label"
						class="property-label"><g:message
								code="participante.evento.label" default="Evento" /></span> <span
						class="property-value" aria-labelledby="evento-label"><g:link
								controller="evento" action="show"
								id="${participanteInstance?.evento?.id}">
								${participanteInstance?.evento?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${participanteInstance?.matricula}">
					<li class="fieldcontain"><span id="matricula-label"
						class="property-label"><g:message
								code="participante.matricula.label" default="Matricula" /></span> <span
						class="property-value" aria-labelledby="matricula-label"><g:fieldValue
								bean="${participanteInstance}" field="matricula" /></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:participanteInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${participanteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
</body>
</html>
