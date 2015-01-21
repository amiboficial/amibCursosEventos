<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>
		
<!-- INICIA: SCRIPT PARA DOCUMENTOS -->
		 <g:render template="../common/multiDocs"/>
	    <g:javascript src="mx.amib.sistemas.cursoseventos.form.docsMultiWidget.js" />
		<g:javascript src="mx.amib.sistemas.cursoseventos.cursos.form.docsValidator.js" /> 
		<script type="text/javascript">
		$(function(){
			var docs = [
			<g:each in="${eventoInstance.documentoEvento}">
				{ grailsId: ${it.id}, uuid:'${it.uuid}', idTipo:${it.tipoDocumentoEvento.id}, dsTipo:'${it.tipoDocumentoEvento.tipoDocumentoEvento}', nombre:'${it.nombreDeArchivo}', _urlDown:'<g:createLink controller="documento" action="download" id="${it.uuid}"/>',_urlDelete:'' },
			</g:each> ];
			
			<g:each in="${viewModelInstance.tipoDocumentoList}">
				app.DocsValidator.addDocType(${it.id});
			</g:each>
			
			var docsView = new app.DocsView(docs);
			docsView.validator = app.DocsValidator;

			docsView.viewModel.set('urlUpload','<g:createLink controller="documento" action="upload" />');
			docsView.viewModel.set('urlDownloadNew','<g:createLink controller="documento" action="downloadNew"/>');
			docsView.viewModel.set('urlDeleteNew','<g:createLink controller="documento" action="delete"/>');
		});
		</script>
		<!-- FIN: SCRIPT PARA DOCUMENTOS  -->
	 
	<!-- INICIA: SCRIPT PARA FUNCIONAMIENTO DE AUTORIZADOS -->
	<g:render template="participantes"/>
	<g:javascript src="mx.amib.sistemas.registro.evento.form.participantesWidget.js" />
	<script type="text/javascript">
		$(function(){ 
			var participantes = [
				<g:each in="${eventoInstance?.participantes?.sort{it.numeroMatricula} }">
					{  grailsId: ${it.id}, numeroMatricula:${it.numeroMatricula}, nombreCompleto:'${it.nombreCompleto}' },
				</g:each>
			];
			var participantesView = new app.ParticipantesView(participantes);
			participantesView.ajaxUrl = '<g:createLink action="obtenerSustentantePorMatricula"/>';
		});
	</script>
	<!-- FIN: SCRIPT PARA FUNCIONAMIENTO DE AUTORIZADOS -->
	
	<!-- INICIO: SCRIPT PARA VISTA -->
	<g:javascript src="mx.amib.sistemas.cursoseventos.oficioCNBV.form.js" />
	<!-- FIN: SCRIPT PARA VISTA-->