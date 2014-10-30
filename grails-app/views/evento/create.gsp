<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'evento.label', default: 'Evento')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<!-- cdn for modernizr, if you haven't included it already -->
<script
	src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<!-- polyfiller file to detect and load polyfills -->
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<script>
 		 webshims.setOptions('waitReady', false);
		 webshims.setOptions('forms-ext', {types: 'date'});
		 webshims.polyfill('forms forms-ext');
		</script>

<script type="text/javascript">
	$(function() {
		/* Obtencion de datos desde el código postal */
		$('#txtCP').change( function(){
			
			if( $('#txtCP').val().length == 5 )
			{
				$.ajax({
					dataType: 'json',
					url: '<g:createLink controller="evento" action="findSepomex" />' + '/' + $('#txtCP').val(),
					data: 'traditional '
				}).done(function(data){

					if(data.length > 0)
					{
						var asentamientos = '<option value="">-Seleccione-</option>';
						
						/* Rellena una cadena de opciones con los asentamientos obtenidos */
				        for(var i = 0; i < data.length;i++)
				        {
			                asentamientos += '<option value="'+data[i].id+'">'+data[i].asentamiento.nombre+'</option>';
				        }		
						
						$('#txtEntidad').val(data[0].asentamiento.municipio.entidadFederativa.nombre);
						$('#txtDelegacion').val(data[0].asentamiento.municipio.nombre);
						$('#txtCiudad').val(data[0].ciudad.municipio.entidadFederativa.nombre);
						//$("#selAsentamiento").removeAttr('disabled');
						$('#selAsentamiento').html(asentamientos);
						/* Carga el valor si es que ya lo trae del modelo*/
						$('#selAsentamiento').val('${domicilioSEDESepomex?.clave?.codigoPostal}');
					}
					else
					{
						limpiaDomicilio();
					}
					
				});
			}
			else
			{
				limpiaDomicilio();
			}
			
		});

		/* Carga los valores de sepomex del modelo */
		$('#txtCP').val('${eventoInstance?.domicilioSEDESepomex?.codigoPostal}');
		$('#txtCP').trigger('change');

		
		/* Trimeo de campos al perder el focus */
		$( "form" ).focusout(function() {
			trimAllFields();
		});
  
	});

	function limpiaDomicilio()
	{
		$('#txtEntidad').val('');
		$('#txtDelegacion').val('');
		$('#txtCiudad').val('');
		$('#selAsentamiento').html('<option value="">-Seleccione-</option>');
	}
	</script>
	
</head>
<body>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="navigation">

				<li><g:link class="list btn btn-primary colortitle colorblack"
						action="index">Gestión de Eventos</g:link></li>
			</ul>
			<br>
		</div>
	</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="create-evento" class="content scaffold-create" role="main">
						<h1>Crear Eventos</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>
			<br>

			<g:hasErrors bean="${eventoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${eventoInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:eventoInstance, action:'save']">
				<fieldset class="form">
					<g:render template="form" />

					<br>

					<table class="table">
						<thead>
							<tr>Participantes
							</tr>
							<tr>
								<th>Matricula</th>
								<th>Nombre</th>

								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyParticipantes">
							<tr>
								<td><input id="txtNewMatricula" class="form-control"
									type="text" /></td>
								<td><input id="txtNewNombreParticipante"
									class="form-control" type="text" /></td>

								<td>
									<button id="btnAddNewParticipante"
										class="add btn btn-success btn-sm">
										<span class="glyphicon glyphicon-plus"></span> Agregar
									</button>
								</td>
							</tr>

						</tbody>
					</table>


					<table class="table">
						<thead>
							<tr>Expositores
							</tr>
							<tr>
								<th>Nombre</th>
								<th>Apellido Paterno</th>
								<th>Apellido Materno</th>
								
								<th>Horas</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyExpositores">
							<tr>
								<td><input id="txtNewNomExpositor" class="form-control"
									type="text" /></td>
								<td><input id="txtNewPriApeExpositor" class="form-control"
									type="text" /></td>
								<td><input id="txtNewSegApeExpositor" class="form-control"
									type="text" /></td>

								<td><input id="NumNewhora" class="form-control"
									type="number" /></td>
								<td>
									<button id="btnAddNewExpositor"
										class="add btn btn-success btn-sm">
										<span class="glyphicon glyphicon-plus"></span> Agregar
									</button>
								</td>
							</tr>

						</tbody>
					</table>

					<table class="table">
						<thead>
							<tr>Horarios
							</tr>
							<tr>
								<th>Dia</th>
								<th>Hora inicio</th>
								<th>Hora fin</th>
								<th>Fecha de creacion</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyHorarios">
							<tr>
								<td><input id="txtNewDia" class="form-control" type="date"
									date-date-format="yyyy-mm-dd" data-date='{"startView": 2}' />
								</td>
								<td><input id="txtNewHoraInicio" class="form-control"
									type="date" date-date-format=" HH:mm" /></td>
								<td><input id="txtNewHoraFin" class="form-control"
									type="date" date-date-format=" HH:mm" /></td>
								<td><input id="dateNewFechaCreacionhor"
									class="form-control" type="date" date-date-format="yyyy-mm-dd"
									data-date='{"startView": 2}' /></td>
								<td>
									<button id="btnAddNewHorarios"
										class="add btn btn-success btn-sm">
										<span class="glyphicon glyphicon-plus"></span> Agregar
									</button>
								</td>
							</tr>

						</tbody>
					</table>

					<script type="text/template" id="participanteTemplate">
						<td>{{=matricula}}</td>
						<td>{{=nombreParticipante}}</td>
						
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="participante" value="{ 'id':{{=grailsId}}, 'matricula' : {{=matricula}}, 'nombreParticipante' : {{=nombreParticipante}} } " />
						</td>
					</script>

					<script type="text/javascript">

					//definimos un "contexto"
					var parWidget = parWidget || {}

					//ahi va el modelo
					parWidget.Participante = Backbone.Model.extend({
						defaults: {
							idx: -1, 
							grailsId: -1, 
							nombreParticipante: '',
							matricula: '',
							}
					});

				
					parWidget.Participantes = Backbone.Collection.extend({
					model: parWidget.Participante
						});

						

					
						parWidget.ParticipanteView = Backbone.View.extend({
						tagName: 'tr', 
						className: 'participanteRow',
						template: _.template( $('#participanteTemplate').html() ), 

						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); 
						return this; 
						},

					events:{
						
						'click .delete':'quitarParticipante' 
							},

					quitarParticipante: function(){
					
					this.model.destroy(); 
					
					this.remove(); 
					}
					});

		
				parWidget.ParticipantesView = Backbone.View.extend({
				el: '#tbdyParticipantes', 

					initialize: function( initialParticipantes ){
						this.collection = new parWidget.Participantes(initialParticipantes); 
						this.render();
						this.listenTo( this.collection, 'add', this.renderParticipante ); 
																     
					},

					render: function(){
						this.collection.each ( function(item){
						this.renderParticipante(item)
						}, this );
					},

				
					renderParticipante: function(item){
					var participanteView = new parWidget.ParticipanteView({model:item});
					this.$el.append( participanteView.render().el );
					},

					events:{
					'click #btnAddNewParticipante': 'agregarParticipante'
					},

					agregarParticipante: function(e) {
					e.preventDefault(); 

				
			
				var _nombreParticipante = $('#txtNewNombreParticipante').val();
				var _matricula = $('#txtNewMatricula').val();
				var _idx = _.size(this.collection) 
				var participante = new parWidget.Participante( {  nombreParticipante: _nombreParticipante , matricula: _matricula , idx: _idx } );
		
				this.collection.add(participante);
					}
			});

		$(function(){
			new parWidget.ParticipantesView();
		});
		</script>



					<script type="text/template" id="expositorTemplate">
						<td>{{=nombreExpositor}}</td>
						<td>{{=primerApellidoExpositor}}</td>
						<td>{{=segundoApellidoExpositor}}</td>
				
						<td>{{=horas}}</td>
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="expositor" value="{ 'id':{{=grailsId}}, 'nombreExpositor' : {{=nombreExpositor}}, 'primerApellidoExpositor' : {{=primerApellidoExpositor}}, 
							 'segundoApellidoExpositor' : {{=segundoApellidoExpositor}}, 'horas' : {{=horas}} } " />
						</td>
					</script>


					<script type="text/javascript">

				
					var exWidget = exWidget || {}

				
					exWidget.Expositor = Backbone.Model.extend({
						defaults: {
							idx: -1, 
							grailsId: -1, 
							horas: '',
							
							segundoApellidoExpositor: '',
							primerApellidoExpositor: '',
							nombreExpositor: '',
							}
					});

			
					exWidget.Expositores = Backbone.Collection.extend({
					model: exWidget.Expositor
						});

					

					
						exWidget.ExpositorView = Backbone.View.extend({
						tagName: 'tr', 
						className: 'expositorRow',
						template: _.template( $('#expositorTemplate').html() ), 
						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); 
						return this; 
						},

					events:{
					
						'click .delete':'quitarExpositor' 
							},

					quitarExpositor: function(){
				
					this.model.destroy(); 
					
					this.remove(); 
					}
					});

			
				exWidget.ExpositoresView = Backbone.View.extend({
				el: '#tbdyExpositores', 

					initialize: function( initialExpositores ){
						this.collection = new exWidget.Expositores(initialExpositores); 
						this.render();
						this.listenTo( this.collection, 'add', this.renderExpositor ); 
					},

					render: function(){
						this.collection.each ( function(item){
						this.renderExpositor(item)
						}, this );
					},

				
					renderExpositor: function(item){
					var expositorView = new exWidget.ExpositorView({model:item});
					this.$el.append( expositorView.render().el );
					},

					events:{
					'click #btnAddNewExpositor': 'agregarExpositor'
					},

					agregarExpositor: function(e) {
					e.preventDefault();	
				var _horas = $('#NumNewhora').val();
			
				var _segundoApellidoExpositor = $('#txtNewSegApeExpositor').val();
				var _primerApellidoExpositor = $('#txtNewPriApeExpositor').val();
				var _nombreExpositor = $('#txtNewNomExpositor').val();
				var _idx = _.size(this.collection) 
				var expositor = new exWidget.Expositor( { horas: _horas ,  segundoApellidoExpositor: _segundoApellidoExpositor , primerApellidoExpositor: _primerApellidoExpositor , nombreExpositor: _nombreExpositor , idx: _idx } );
		
				this.collection.add(expositor);
					}
			});

		$(function(){
			new exWidget.ExpositoresView();
		});

</script>

					<script type="text/template" id="horarioEventoTemplate">
						<td>{{=fechaDia}}</td>
						<td>{{=horaInicio}}</td>
						<td>{{=horafin}}</td>
						<td>{{=fechaCreacion}}</td>
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="horarioEvento" value="{ 'id':{{=grailsId}}, 'fechaDia' : {{=fechaDia}}, 'horaInicio' : {{=horaInicio}}, 'horafin' : {{=horafin}}, 'fechaCreacion' : {{=fechaCreacion}} } " /></td>
					</script>
					<script type="text/javascript">
					var perWidget = perWidget || {}
					perWidget.HorarioEvento = Backbone.Model.extend({
						defaults: {
							idx: -1, 
							grailsId: -1, 
							fechaCreacion: '',
							horafin: '',
							horaInicio: '',
							fechaDia: '',
							}
					});
					perWidget.HorarioEventos = Backbone.Collection.extend({
					model: perWidget.HorarioEvento
						});
						perWidget.HorarioEventoView = Backbone.View.extend({
						tagName: 'tr', 
						className: 'HorarioEventoRow',
						template: _.template( $('#horarioEventoTemplate').html() ), 
						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); 
						return this; 
						},
					events:{
						'click .delete':'quitarHorarioEvento' 
							},
					quitarHorarioEvento: function(){
					this.model.destroy(); 
					this.remove(); 
					}
					});
				perWidget.HorarioEventosView = Backbone.View.extend({
				el: '#tbdyHorarios', 
					initialize: function( initialHorarioEventos ){
						this.collection = new perWidget.HorarioEventos(initialHorarioEventos); 
						this.render();
						this.listenTo( this.collection, 'add', this.renderHorarioEvento ); 
					},
					render: function(){
						this.collection.each ( function(item){
						this.renderHorarioEvento(item)
						}, this );
					},
					renderHorarioEvento: function(item){
					var horarioEventoView = new perWidget.HorarioEventoView({model:item});
					this.$el.append( horarioEventoView.render().el );
					},
					events:{
					'click #btnAddNewHorarios': 'agregarHorarioEvento'
					},
					agregarHorarioEvento: function(e) {
					e.preventDefault();	//aqui se ponen las variables a capturar 
				var _fechaCreacion = $('#dateNewFechaCreacionhor').val();
				var _horafin = $('#txtNewHoraFin').val();
				var _horaInicio = $('#txtNewHoraInicio').val();
				var _fechaDia = $('#txtNewDia').val();
				var _idx = _.size(this.collection) 
				var horarioEvento = new perWidget.HorarioEvento( { fechaCreacion: _fechaCreacion , horafin: _horafin , horaInicio: _horaInicio , fechaDia: _fechaDia , idx: _idx } );
		
				this.collection.add(horarioEvento);
					}
			});
		$(function(){
			new perWidget.HorarioEventosView();
		});

</script>


				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create"
						class="save btn btn-primary colortitle colorblack"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack"
						action="index">Regresar</g:link>
				</fieldset>
				<br>
			</g:form>
		</div>
</body>
</html>
