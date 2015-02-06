
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
				<li><g:link class="list btn btn-default btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-cursos" class="content scaffold-show" role="main">
						<h1>
							Mostrar Curso
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

			<ul class="property-list cursos list-group">

				<g:if test="${cursosInstance?.nombreDelCurso}">
					<li class="fieldcontain list-group-item"><span id="nombreDelCurso-label"
						class="property-label"><g:message
								code="cursos.nombreDelCurso.label" default="Nombre Del Curso: " /></span>

						<span class="property-value"
						aria-labelledby="nombreDelCurso-label"><g:fieldValue
								bean="${cursosInstance}" field="nombreDelCurso" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.siglas}">
					<li class="fieldcontain list-group-item"><span id="siglas-label"
						class="property-label"><g:message
								code="cursos.siglas.label" default="Siglas" /></span> <span
						class="property-value" aria-labelledby="siglas-label"><g:fieldValue
								bean="${cursosInstance}" field="siglas" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.objetivoDelCurso}">
					<li class="fieldcontain list-group-item"><span id="objetivoDelCurso-label"
						class="property-label"><g:message
								code="cursos.objetivoDelCurso.label"
								default="Objetivo Del Curso: " /></span> <span class="property-value"
						aria-labelledby="objetivoDelCurso-label"><g:fieldValue
								bean="${cursosInstance}" field="objetivoDelCurso" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.duracionEnHoras}">
					<li class="fieldcontain list-group-item"><span id="duracionEnHoras-label"
						class="property-label"><g:message
								code="cursos.duracionEnHoras.label" default="Duracion En Horas" /></span>

						<span class="property-value"
						aria-labelledby="duracionEnHoras-label"><g:fieldValue
								bean="${cursosInstance}" field="duracionEnHoras" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.observaciones}">
					<li class="fieldcontain list-group-item"><span id="observaciones-label"
						class="property-label"><g:message
								code="cursos.observaciones.label" default="Observaciones: " /></span> <span
						class="property-value" aria-labelledby="observaciones-label"><g:fieldValue
								bean="${cursosInstance}" field="observaciones" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.nombreCoordinador}">
					<li class="fieldcontain list-group-item"><span id="nombreCoordinador-label"
						class="property-label"><g:message
								code="cursos.nombreCoordinador.label"
								default="Nombre Coordinador: " /></span> <span class="property-value"
						aria-labelledby="nombreCoordinador-label"><g:fieldValue
								bean="${cursosInstance}" field="nombreCoordinador" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.primerApellidoCoordinador}">
					<li class="fieldcontain list-group-item"><span
						id="primerApellidoCoordinador-label" class="property-label"><g:message
								code="cursos.primerApellidoCoordinador.label"
								default="Apellido Paterno: " /></span> <span
						class="property-value"
						aria-labelledby="primerApellidoCoordinador-label"><g:fieldValue
								bean="${cursosInstance}" field="primerApellidoCoordinador" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.segundoApellidoCordinador}">
					<li class="fieldcontain list-group-item"><span
						id="segundoApellidoCordinador-label" class="property-label"><g:message
								code="cursos.segundoApellidoCordinador.label"
								default="Apellido Materno" /></span> <span
						class="property-value"
						aria-labelledby="segundoApellidoCordinador-label"><g:fieldValue
								bean="${cursosInstance}" field="segundoApellidoCordinador" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.telefonoFijoCoordinador}">
					<li class="fieldcontain list-group-item"><span
						id="telefonoFijoCoordinador-label" class="property-label"><g:message
								code="cursos.telefonoFijoCoordinador.label"
								default="Telefono: " /></span> <span
						class="property-value"
						aria-labelledby="telefonoFijoCoordinador-label"><g:fieldValue
								bean="${cursosInstance}" field="telefonoFijoCoordinador" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.faxCoordinador}">
					<li class="fieldcontain list-group-item"><span id="faxCoordinador-label"
						class="property-label"><g:message
								code="cursos.faxCoordinador.label" default="Fax: " /></span>

						<span class="property-value"
						aria-labelledby="faxCoordinador-label"><g:fieldValue
								bean="${cursosInstance}" field="faxCoordinador" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.email}">
					<li class="fieldcontain list-group-item"><span id="email-label"
						class="property-label"><g:message code="cursos.email.label"
								default="Email: " /></span> <span class="property-value"
						aria-labelledby="email-label"><g:fieldValue
								bean="${cursosInstance}" field="email" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.status}">
					<li class="fieldcontain list-group-item"><span id="status-label"
						class="property-label"><g:message
								code="cursos.status.label" default="Status" /></span> <span
						class="property-value" aria-labelledby="status-label"><g:fieldValue
								bean="${cursosInstance}" field="status" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.fechaCreacion}">
					<li class="fieldcontain list-group-item"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="cursos.fechaCreacion.label" default="Fecha de Creacion: " /></span> <span
						class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${cursosInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.fechaModificacion}">
					<li class="fieldcontain list-group-item"><span id="fechaModificacion-label"
						class="property-label"><g:message
								code="cursos.fechaModificacion.label"
								default="Fecha Modificacion" /></span> <span class="property-value"
						aria-labelledby="fechaModificacion-label"><g:formatDate
								date="${cursosInstance?.fechaModificacion}" /></span></li>
				</g:if>

				<g:if test="${cursosInstance?.cambioStatus}">
					<li class="fieldcontain list-group-item"><span id="cambioStatus-label"
						class="property-label"><g:message
								code="cursos.cambioStatus.label" default="Cambio de Estatus: " /></span> <g:each
							in="${cursosInstance.cambioStatus}" var="c">
							<span class="property-value" aria-labelledby="cambioStatus-label"><g:link
									controller="cambioStatus" action="show" id="${c.id}">
									${c?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<%-- <g:if test="${cursosInstance?.documentoCurso}">
					<li class="fieldcontain list-group-item"><span id="documentoCurso-label"
						class="property-label"><g:message
								code="cursos.documentoCurso.label" default="Documentos del Curso: " /></span>

						<g:each in="${cursosInstance.documentoCurso}" var="d">
							<span class="property-value"
								aria-labelledby="documentoCurso-label"><g:link
									controller="documentoCursos" action="show" id="${d.id}">
									${d?.tipoDocumentoCurso.tipoDoumentoCurso.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>--%>

				<g:if test="${cursosInstance?.eventos}">
					<li class="fieldcontain list-group-item"><span id="eventos-label"
						class="property-label"><g:message
								code="cursos.eventos.label" default="Eventos: " /></span> <g:each
							in="${cursosInstance.eventos}" var="e">
							<span class="property-value" aria-labelledby="eventos-label"><g:link
									controller="evento" action="show" id="${e.id}">
									${e?.nombreCordinador.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${cursosInstance?.tipoCurso}">
					<li class="fieldcontain list-group-item"><span id="tipoCurso-label"
						class="property-label"><g:message
								code="cursos.tipoCurso.label" default="Tipo de Cruso: " /></span> <g:each
							in="${cursosInstance.tipoCurso}" var="t">
							<span class="property-value" aria-labelledby="tipoCurso-label"><g:link
									controller="tipoCurso" action="show" id="${t.id}">
									${t?.descripcion.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>
				
<fieldset>
	<legend><i>Datos de Documentos</i></legend>
			<table class="table">
				<thead>
					<tr>
						<th style='width:20%;'>Nombre</th>
						<th style='width:20%;'>Tipo</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${cursosInstance?.documentoCurso}">
						<tr>
							<td>${it.nombreDeArchivo}</td>
							<td>${it.tipoDocumentoCurso?.tipoDoumentoCurso}</td>

						</tr>
					</g:each>
				</tbody>
			</table>
</fieldset>

			</ul><br>
			<g:form url="[resource:cursosInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit  btn btn-default btn-primary" action="edit" resource="${cursosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						&nbsp;
					<g:actionSubmit class="delete btn btn-default btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						&nbsp;
					<g:link class="list btn btn-default btn-primary" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>
		

			
			
		
		
		<!-- INCIA: SCRIPTS ESPECIFICOS DE VISTA -->
	<script>
	function btnNuevaRevoc_click(){
		window.location.href = "<g:createLink controller="cursos" action="create" />";
	}
	function btnRevisarRevoc_click(id){
		window.location.href = "<g:createLink controller="cursos" action="editVerify" />/"+id;
	}
	function btnEditarRevoc_click(id){
		window.location.href = "<g:createLink controller="cursos" action="edit" />/"+id;
	}
	function btnEliminarRevoc_click(id){
		var url = '<g:createLink controller="cursos" action="delete" />/'+id
		var r = confirm("¿Desea eliminar el elemento seleccionado?");
		if(r == true)
			window.location.href = url;
	}
	function btnDescargar_click(uuid){
		window.open("<g:createLink controller="documentoCursos" action="download" />/"+uuid);
	}
	</script>
	<!-- FIN: SCRIPTS ESPECIFICOS DE VISTA -->
</body>
</html>
