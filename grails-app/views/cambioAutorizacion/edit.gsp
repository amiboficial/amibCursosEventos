<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.log.CambioAutorizacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="vavBar">
			
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Cambios de Autorización</g:link></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Cambios de Autorización</g:link></li>
			</ul><br>
		</div>
	</fieldset>
		<fieldset>
			<div class="panel panel-default col-lg-12">
				<div class="panel-heading">
					<div class="widgetTitle">
						<div id="edit-cambioAutorizacion" class="content scaffold-edit"
							role="main">
							<h1>
								Editar Cambios de Autorización
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
				

				<g:hasErrors bean="${cambioAutorizacionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${cambioAutorizacionInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<g:form url="[resource:cambioAutorizacionInstance, action:'update']"
					method="PUT">
					<g:hiddenField name="version"
						value="${cambioAutorizacionInstance?.version}" />
					<fieldset class="form">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save btn btn-primary colortitle colorblack" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						&nbsp;
						<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
					</fieldset><br>
				</g:form>
			</div>
			</fieldset>
	</body>
</html>
