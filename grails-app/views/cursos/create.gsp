<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			<br>
			<ul class="nav navbar-nav" role="navigation">
				<li><g:link class="list btn btn-default btn-primary" action="index">Gestión cursos</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="create-cursos" class="content scaffold-create" role="main">
						<h1>
							Crear Curso 
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

			<g:hasErrors bean="${cursosInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${cursosInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:cursosInstance, action:'save']">
				<fieldset class="form">
					<g:render template="form" />
					<br>
					<g:render template="formJs"/>
					<br>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-default btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					&nbsp;
					<g:link class="list btn btn-default btn-primary" action="index">Regresar</g:link>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
