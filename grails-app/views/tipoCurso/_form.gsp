<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso" %>



<div class="fieldcontain ${hasErrors(bean: tipoCursoInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="tipoCurso.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoCursoInstance?.vigente}" />

</div>

<div class="fieldcontain ${hasErrors(bean: tipoCursoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoCurso.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoCursoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoCursoInstance, field: 'cursos', 'error')} ">
	<label for="cursos">
		<g:message code="tipoCurso.cursos.label" default="Cursos" />
		
	</label>
	<g:select name="cursos" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" multiple="multiple" optionKey="id" size="5" value="${tipoCursoInstance?.cursos*.id}" class="many-to-many"/>

</div>

