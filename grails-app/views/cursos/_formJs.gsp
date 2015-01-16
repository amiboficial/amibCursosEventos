<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>

<!-- INICIA: SCRIPT PARA DOCUMENTOS -->
<g:render template="../common/multiDocs"/>
<g:javascript src="mx.amib.sistemas.cursoseventos.form.docsMultiWidget.js" />
<g:javascript src="mx.amib.sistemas.cursoseventos.cursos.form.docsValidator.js" />
<script type="text/javascript">
$(function(){
	var docs = [
				<g:each in="${cursosInstance.documentoCurso}">
					{ grailsId: ${it.id}, uuid:'${it.uuid}', idTipo:${it.tipoDocumentoCurso.id}, dsTipo:'${it.tipoDocumentoCurso.tipoDoumentoCurso}', nombre:'${it.nombreDeArchivo}', status:app.ST_VM_DOC_READY ,_urlDown:'<g:createLink controller="documento" action="download" id="${it.uuid}"/>',_urlDelete:'' },
				</g:each> ];
				
				<g:each in="${viewModelInstance.tipoDocumentoList}">
					app.DocsValidator.addDocType(${it.id});
				</g:each>
	var docsView = new app.DocsView(docs); //<--- esto...
	docsView.validator = app.DocsValidator;
	
	docsView.viewModel.set('urlUpload','<g:createLink controller="documento" action="upload" />');
	docsView.viewModel.set('urlDownloadNew','<g:createLink controller="documento" action="downloadNew"/>');
	docsView.viewModel.set('urlDeleteNew','<g:createLink controller="documento" action="delete"/>');
});
</script>
<!-- FIN: SCRIPT PARA DOCUMENTOS  -->
