<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
				<li><g:link class="list btn btn-default btn-primary" action="index">Gestión curso</g:link></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><g:link class="create btn btn-default btn-primary" action="create">Crear curso</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="edit-cursos" class="content scaffold-edit" role="main">
						<h1>
							Editar Curso
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
			<!--   <g:hasErrors bean="${cursosInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${cursosInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors> -->
			<g:form url="[resource:cursosInstance, action:'update']" method="PUT">
				<g:hiddenField name="version" value="${cursosInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save btn btn-default btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					&nbsp;
					<g:link class="list btn btn-default btn-primary" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>

		<g:render template="formJs" />
	
</body>
</html>
