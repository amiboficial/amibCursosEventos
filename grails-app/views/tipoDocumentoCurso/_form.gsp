<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'tipoDoumentoCurso', 'error')} ">
	<label for="tipoDoumentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.tipoDoumentoCurso.label" default="Tipo Doumento Curso" />
		
	</label>
	<g:textField name="tipoDoumentoCurso" maxlength="100" value="${tipoDocumentoCursoInstance?.tipoDoumentoCurso}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'clave', 'error')} required">
	<label for="clave" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${tipoDocumentoCursoInstance?.clave}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'documentoCurso', 'error')} ">
	<label for="documentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.documentoCurso.label" default="Documento Curso" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoDocumentoCursoInstance?.documentoCurso?}" var="d">
    <li><g:link controller="documentoCursos" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoCursos" action="create" params="['tipoDocumentoCurso.id': tipoDocumentoCursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoCursos.label', default: 'DocumentoCursos')])}</g:link>
</li>
</ul>


</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'estatus', 'error')} ">
	<label for="estatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.estatus.label" default="Estatus" />
		
	</label>
	<g:checkBox name="estatus" value="${tipoDocumentoCursoInstance?.estatus}" class ="form-control" />

</div>
</div>
