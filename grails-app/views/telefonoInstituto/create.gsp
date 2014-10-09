<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="navigation">
				<!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Teléfonos de Institutos</g:link></li>
			</ul>
			<br>
		</div>
	</fieldset>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="create-telefonoInstituto" class="content scaffold-create"
						role="main">
						<h1>
							Crear Teléfonos de Institutos
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
	

	<g:hasErrors bean="${telefonoInstitutoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${telefonoInstitutoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:telefonoInstitutoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset></br>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary colortitle colorblack" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
			<br>
		</div>
			</fieldset>
	</body>
</html>
