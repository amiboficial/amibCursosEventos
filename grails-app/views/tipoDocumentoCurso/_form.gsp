<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso" %>

<div class="form-inline" role="form">


<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'tipoDoumentoCurso', 'error')} ">
	<label for="tipoDoumentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.tipoDoumentoCurso.label" default="Tipo Doumento Curso" />
		
	</label>
	<g:field name="tipoDoumentoCurso" type="number" value="${tipoDocumentoCursoInstance.tipoDoumentoCurso}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoCursoInstance, field: 'documentoCurso', 'error')} ">
	<label for="documentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoCurso.documentoCurso.label" default="Documento Curso"/>
		<span class="required-indicator">*</span>
	</label>
	

<g:select id="documentoCursos" name="documentoCursos.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos.list()}" optionKey="id" required="" value="${cursosInstance?.documentoCurso?.id}" class="many-to-one"/>

</div>
</div>

