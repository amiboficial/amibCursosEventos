<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="navigation">
			
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Eventos</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="create-evento" class="content scaffold-create" role="main">
						<h1>
							Crear Eventos
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
						<tr>
						Participantes
						</tr>
							<tr>
								<th>Matricula</th>
								<th>Nombre</th>
								<th>Fecha de creacion</th>
								<th>Fecha de modificacion</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyParticipantes">
							<tr>
								<td>
									<input id="txtNewMatricula" class="form-control" type="text" />
								</td>
								<td>
									<input id="txtNewNombreParticipante" class="form-control" type="text" />
								</td>
								<td>
									<input id="dateNewFechaCreacion" class="form-control" type="date" />
								</td>
								<td>
									<input id="dateNewFechaModificacion" class="form-control" type="date" />
								</td>					
								<td>
									<button id="btnAddNewParticipante" class="add btn btn-success btn-sm"> <span class="glyphicon glyphicon-plus"></span> Agregar </button>
								</td>
							</tr>

						</tbody>
					</table>
					
					<script type="text/template" id="participanteTemplate">
						<td>{{=matricula}}</td>
						<td>{{=nombreParticipante}}</td>
						<td>{{=fechaCreacion}}</td>
						<td>{{=fechaModificacion}}</td>
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="participante" value="{ 'id':{{=grailsId}}, 'matricula' : {{=matricula}}, 'nombreParticipante' : {{=nombreParticipante}}, 
							 'fechaCreacion' : {{=fechaCreacion}},  'fechaModificacion' : {{=fechaModificacion}} } " />
						</td>
					</script>
					
					<script type="text/javascript">

					//definimos un "contexto"
					var parWidget = parWidget || {}

					//ahi va el modelo
					parWidget.Participante = Backbone.Model.extend({
						defaults: {
							idx: -1, //el indice de la lista
							grailsId: -1, //para cuando son nuevos
							//idTipoTelefono: 0, //la id no va
							fechaModificacion: '',
							fechaCreacion: '',
							nombreParticipante: '',
							matricula: '',
							}
					});

					//se define la "coleccion" correspondiente
					parWidget.Participantes = Backbone.Collection.extend({
					model: parWidget.Participante
						});

						//hasta ahi ya definimos el modelo;
						//ahora hay que hacer un prototipo rapido de la vista para ver
						//como iría quedado; me imagino una parecida a lo de los apoderados no???? si... va
						//mmm deja pienso...

						//definiendo vista para el modelo de telefono
						parWidget.ParticipanteView = Backbone.View.extend({
						tagName: 'tr', //el tag con el que estaría representado cada elemento del modelo
						className: 'participanteRow',
						template: _.template( $('#participanteTemplate').html() ), //para no estar escribiendo "html" en el javascript, definimos templates

						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); //$el se podría decir que es como la refería al "dom" de este elemento de vista...
																			   //lo que hariamos aqui es que el html de ese elemento lo rellamos con lo que definimos
		   																	   //como template que a su vez se va a rellenar con los datos del modelo
						return this; //faltaba esto...
						},

					events:{
						//aqui se podria decir que es donde conecta los callback a lo que en MVC se suele ver como "metodos de controlador"
						'click .delete':'quitarParticipante' //aqui conectaria al boton de borrar para pueda hacer la accion de quitar telefono
							},

					quitarParticipante: function(){
					//Destruye el modelo
					this.model.destroy(); //el this.model sería el modelo al que esta referenciado la vista; aunque no lo declaramos, se "asigna dinamicamente"
					//Destruye la vista
					this.remove(); //con esta accion es que practicamente "desapareceria" del DOM este elemento
					}
					});

				//defininedo la vista para la colección
				parWidget.ParticipantesView = Backbone.View.extend({
				el: '#tbdyParticipantes', //aqui si estamos definiendo a que elemento del DOM corresponde esta vista

					initialize: function( initialParticipantes ){
						this.collection = new parWidget.Participantes(initialParticipantes); //initial telefonos puede ser un arreglo de modelos "precargado"
						this.render();
						this.listenTo( this.collection, 'add', this.renderParticipante ); //este metodo hace que se "escuche" a los cambios de la colección
																      //cada que alla un cambio manda a llamar a esa funcion, que se va a
	      																//encargar de crear una vista de "telefono" y agregarla a la vista
																		//de la colección
					},

					render: function(){
						this.collection.each ( function(item){
						this.renderParticipante(item)
						}, this );
					},

					//aqui manda a "llamar" a que se rendere cada "modelo"
					renderParticipante: function(item){
					var participanteView = new parWidget.ParticipanteView({model:item});
					this.$el.append( participanteView.render().el );
					},

					events:{
					'click #btnAddNewParticipante': 'agregarParticipante'
					},

					agregarParticipante: function(e) {
					e.preventDefault(); //para que no haga submit... creo...

				//aqui saca los datos del formulario al modelo que vayamos a crear		
				var _fechaModificacion = $('#dateNewFechaModificacion').val();
				var _fechaCreacion = $('#dateNewFechaCreacion').val();
				var _nombreParticipante = $('#txtNewNombreParticipante').val();
				var _matricula = $('#txtNewMatricula').val();
				var _idx = _.size(this.collection) 
				var participante = new parWidget.Participante( { fechaModificacion: _fechaModificacion , fechaCreacion: _fechaCreacion , nombreParticipante: _nombreParticipante , matricula: _matricula , idx: _idx } );
		
				this.collection.add(participante);
					}
			});

		$(function(){
			new parWidget.ParticipantesView();
		});
		</script>			
		
		<table class="table">
						<thead>
						<tr>
						Horario de Eventos
						</tr>
							<tr>
								<th>Dia</th>
								<th>Hora de Inicio</th>
								<th>Hora de Termino</th>
								<th>Fecha de Creacion</th>
						
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyHorario">
							<tr>
								<td>
									<input id="txtNewDay" class="form-control" type="date" />
								</td>
								<td>
									<input id="txtNewHoraInicio" class="form-control" type="time" />
								</td>
								<td>
									<input id="txtNewHoraFin" class="form-control" type="time" />
								</td>
								<td>
									<input id="dateNewFecha" class="form-control" type="date" />
								</td>
								
												
								<td>
									<button id="btnAddNewHorario" class="add btn btn-success btn-sm"> <span class="glyphicon glyphicon-plus"></span> Agregar </button>
								</td>
							</tr>

						</tbody>
					</table>
		
					<script type="text/template" id="horarioTemplate">
						<td>{{=fechaDia}}</td>
						<td>{{=horaInicio}}</td>
						<td>{{=horafin}}</td>
						<td>{{=fechaCreacion}}</td>
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="horario" value="{ 'id':{{=grailsId}}, 'fechaDia' : {{=fechaDia}}, 'horaInicio' : {{=horaInicio}}, 
							'horafin' : {{=horafin}}, 'fechaCreacion' : {{=fechaCreacion}} } " />
						</td>
					</script>
		
		<script type="text/javascript">

					//definimos un "contexto"
					var horWidget = horWidget || {}

					//ahi va el modelo
					horWidget.Horario = Backbone.Model.extend({
						defaults: {
							idx: -1, //el indice de la lista
							grailsId: -1, //para cuando son nuevos
							//idTipoTelefono: 0, //la id no va
							fechaCreacion: '',
							horafin: '',
							horaInicio: '',
							fechaDia: '',
							}
					});

					//se define la "coleccion" correspondiente
					horWidget.Horarios = Backbone.Collection.extend({
					model: horWidget.Horario
						});

						//hasta ahi ya definimos el modelo;
						//ahora hay que hacer un prototipo rapido de la vista para ver
						//como iría quedado; me imagino una parecida a lo de los apoderados no???? si... va
						//mmm deja pienso...

						//definiendo vista para el modelo de telefono
						horWidget.HorarioView = Backbone.View.extend({
						tagName: 'tr', //el tag con el que estaría representado cada elemento del modelo
						className: 'horarioRow',
						template: _.template( $('#horarioTemplate').html() ), //para no estar escribiendo "html" en el javascript, definimos templates

						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); //$el se podría decir que es como la refería al "dom" de este elemento de vista...
																			   //lo que hariamos aqui es que el html de ese elemento lo rellamos con lo que definimos
		   																	   //como template que a su vez se va a rellenar con los datos del modelo
						return this; //faltaba esto...
						},

					events:{
						//aqui se podria decir que es donde conecta los callback a lo que en MVC se suele ver como "metodos de controlador"
						'click .delete':'quitarHorario' //aqui conectaria al boton de borrar para pueda hacer la accion de quitar telefono
							},

					quitarHorario: function(){
					//Destruye el modelo
					this.model.destroy(); //el this.model sería el modelo al que esta referenciado la vista; aunque no lo declaramos, se "asigna dinamicamente"
					//Destruye la vista
					this.remove(); //con esta accion es que practicamente "desapareceria" del DOM este elemento
					}
					});

				//defininedo la vista para la colección
				horWidget.HorariosView = Backbone.View.extend({
				el: '#tbdyHorario', //aqui si estamos definiendo a que elemento del DOM corresponde esta vista

					initialize: function( initialHorarios ){
						this.collection = new horWidget.Horarios(initialHorarios); //initial telefonos puede ser un arreglo de modelos "precargado"
						this.render();
						this.listenTo( this.collection, 'add', this.renderHorario ); //este metodo hace que se "escuche" a los cambios de la colección
																      //cada que alla un cambio manda a llamar a esa funcion, que se va a
	      																//encargar de crear una vista de "telefono" y agregarla a la vista
																		//de la colección
					},

					render: function(){
						this.collection.each ( function(item){
						this.renderHorario(item)
						}, this );
					},

					//aqui manda a "llamar" a que se rendere cada "modelo"
					renderHorario: function(item){
					var horarioView = new horWidget.HorarioView({model:item});
					this.$el.append( horarioView.render().el );
					},

					events:{
					'click #btnAddNewHorario': 'agregarHorario'
					},

					agregarHorario: function(e) {
					e.preventDefault(); //para que no haga submit... creo...

				//aqui saca los datos del formulario al modelo que vayamos a crear		
				var _fechaCreacion = $('#dateNewFecha').val();
				var _horafin = $('#txtNewHoraFin').val();
				var _horaInicio = $('#txtNewHoraInicio').val();
				var _fechaDia = $('#txtNewDay').val();
				var _idx = _.size(this.collection) 
				var horario = new horWidget.Horario( { fechaCreacion: _fechaCreacion , horafin: _horfin , horaInicio: _horaInicio , fechaDia: _fechaDia , idx: _idx } );
		
				this.collection.add(horario);
					}
			});

		$(function(){
			new horWidget.HorarioView();
		});

</script>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary colortitle colorblack" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link>
				</fieldset><br>
			</g:form>
		</div>
</body>
</html>
