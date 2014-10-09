
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.log.CambioStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioStatus.label', default: 'CambioStatus')}" />
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
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión estatus</g:link></li>
				
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-cambioStatus" class="content scaffold-show"
						role="main">
						<h1>
							Mostrar Cambios de Estatus
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

			<ul class="property-list cambioStatus">

				<g:if test="${cambioStatusInstance?.estatusStatus}">
					<li class="fieldcontain"><span id="estatusStatus-label"
						class="property-label"><g:message
								code="cambioStatus.estatusStatus.label" default="Estatus Status" /></span>

						<span class="property-value" aria-labelledby="estatusStatus-label"><g:formatBoolean
								boolean="${cambioStatusInstance?.estatusStatus}" /></span></li>
				</g:if>

				<g:if test="${cambioStatusInstance?.comentarios}">
					<li class="fieldcontain"><span id="comentarios-label"
						class="property-label"><g:message
								code="cambioStatus.comentarios.label" default="Comentarios" /></span>

						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue
								bean="${cambioStatusInstance}" field="comentarios" /></span></li>
				</g:if>

				<g:if test="${cambioStatusInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="cambioStatus.fechaCreacion.label" default="Fecha Creacion" /></span>

						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${cambioStatusInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${cambioStatusInstance?.curso}">
					<li class="fieldcontain"><span id="curso-label"
						class="property-label"><g:message
								code="cambioStatus.curso.label" default="Curso" /></span> <span
						class="property-value" aria-labelledby="curso-label"><g:link
								controller="cursos" action="show"
								id="${cambioStatusInstance?.curso?.id}">
								${cambioStatusInstance?.curso?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:cambioStatusInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${cambioStatusInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
</body>
</html>
