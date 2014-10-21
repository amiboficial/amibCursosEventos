<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso" %>


<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoCursoInstance, field: 'vigente', 'error')} ">
	<label for="vigente" class="col-lg-2 col-sm-4 col-md-4 col-xs-4 control-label">
		<g:message code="tipoCurso.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoCursoInstance?.vigente}" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoCursoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="col-lg-2 col-sm-4 col-md-4 col-xs-4 control-label">
		<g:message code="tipoCurso.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoCursoInstance?.descripcion}" class ="form-control"/>

</div>
<br>
</div>

