<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: documentoCursosInstance, field: 'documentos', 'error')} ">
	<label for="documentos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoCursos.documentos.label" default="Documentos" />
		
	</label>
	<g:textField name="documentos" maxlength="100" value="${documentoCursosInstance?.documentos}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoCursosInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoCursos.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${documentoCursosInstance?.fechaCreacion}" default="none" noSelection="['': '']"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoCursosInstance, field: 'curso', 'error')} required">
	<label for="curso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoCursos.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" optionKey="id" required="" value="${documentoCursosInstance?.curso?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoCursosInstance, field: 'tipoDocumentoCurso', 'error')} required">
	<label for="tipoDocumentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoCursos.tipoDocumentoCurso.label" default="Tipo Documento Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoDocumentoCurso" name="tipoDocumentoCurso.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso.list()}" optionKey="id" required="" value="${documentoCursosInstance?.tipoDocumentoCurso?.id}" class="many-to-one" class ="form-control"/>

</div>
</div>