var app = app || {};

app.AUT_STATUS_LISTO_NO_MAT = 0;
app.AUT_STATUS_PROCESANDO = 1;
app.AUT_STATUS_LISTO_MAT = 2;

app.AUT_NO_ERR = 0;
app.AUT_MAT_YA_EN_LISTA = 1;
app.AUT_MAT_NOT_FOUND = 2;
app.AUT_SERVER_ERROR = 3;

app.Participante = Backbone.Model.extend({
	defaults: {
		grailsId:-1,
		numeroMatricula:0,
		nombreCompleto:''
	}
});

app.Participantes = Backbone.Collection.extend({
	model: app.Participante
});

app.ParticipanteView = Backbone.View.extend({
	tagName: 'tr',
	template: _.template( $('#participanteTemplate').html() ),
	
	render: function(){
		this.$el.html( this.template( this.model.toJSON() ) );
		return this;
	},
	
	events: {
		'click .delete':'quitarParticipante'
	},
	
	quitarParticipante: function() {
		this.model.destroy();
		this.remove();
	}
})

app.ParticipantesView =  Backbone.View.extend({
	state: app.AUT_STATUS_LISTO_MAT,
	el: '#tbdyParticipantes',
	error: app.AUT_NO_ERR,
	
	ajaxUrl: '',
	
	_newMatricula: '',
	_newNombreCompleto: '',
	
	template: _.template( $('#newParticipanteTemplate').html() ),
	
	initialize: function( initialData ){
		this.collection = new app.Participantes( initialData );
		console.log("paso aqui, hay collecion: " + this.collection );
		this.render();
		
		this.listenTo( this.collection, 'add', this.render );
		
		this.listenTo( this.collection, 'add', this.renderHiddenData );
		this.listenTo( this.collection, 'remove', this.renderHiddenData );
		this.listenTo( this.collection, "reset", this.renderHiddenData );
	},
	
	render: function() {
		this.$el.html( this.template() );
		this.collection.each( function(item){
			this.renderParticipante(item);
		},this );
		this.renderHeader();
	},
	
	renderParticipante: function(item){
		var participanteView = new app.ParticipanteView({model:item});
		this.$el.append( participanteView.render().el );
	},
	
	renderHeader: function() {
		$('#divMsgMatriculaYaEnLista').hide();
		$('#divMsgMatriculaNoEncontrada').hide();
		$('#divMsgProcesandoAutorizado').hide();
		$('#divMsgMatriculaYaEnLista').hide();
		$('#divMsgErrorSolicitud').hide();
	
		if(this.state == app.AUT_STATUS_LISTO_NO_MAT ){
			if(this.error == app.AUT_NO_ERR){
				this.$('.newMatricula').val('');
				this.$('.newNombre').val('');
			}
			else{
				if(this.error == app.AUT_MAT_YA_EN_LISTA){
					$('#divMsgMatriculaYaEnLista').show();
				}
				else if(this.error == app.AUT_MAT_NOT_FOUND){
					this.$('.newNombre').val('');
					$('#divMsgMatriculaNoEncontrada').show();
				}
				else if(this.error == app.AUT_SERVER_ERROR){
					$('#divMsgErrorSolicitud').show();
				}
			}
			this.$('.newMatricula').prop('disabled', false);
			this.$('.newNombre').prop('disabled', true);
			this.$('.add').prop('disabled', true);
		}
		else if(this.state == app.AUT_STATUS_LISTO_MAT ){
			this.$('.newMatricula').val(this._newMatricula);
			this.$('.newNombre').val(this._newNombreCompleto);
			
			this.$('.newMatricula').prop('disabled', false);
			this.$('.newNombre').prop('disabled', true);
			this.$('.add').prop('disabled', false);
		}
		else if(this.state == app.AUT_STATUS_PROCESANDO ){
			$('#divMsgProcesandoParticipante').show();
		
			this.$('.newMatricula').prop('disabled', true);
			this.$('.newNombre').prop('disabled', true);
			this.$('.add').prop('disabled', true);
		}
	},
	
	renderHiddenData: function(){
		var count = 0;
		this.collection.forEach( function(item){
			count = count + 1;
		}
		, this);
		$("#hdnParticipantesWidgetCount").val( count );
	},
	
	events:{
		'click .add': 'agregarParticipante', 
		'blur .newMatricula': 'buscarPorMatricula'
	},
	
	agregarParticipante: function(e){
		e.preventDefault();
		var participante = new app.Participante({numeroMatricula:this._newMatricula,nombreCompleto:this._newNombreCompleto});
		this.collection.add(participante);
		
		// Assign new comparator
		this.collection.comparator = function( model ) {
			return model.get( 'numeroMatricula' );
		}
		// Resort collection
		this.collection.sort();
		
		this.state = app.AUT_STATUS_LISTO_NO_MAT;
		this.error = app.AUT_NO_ERR;
		this.render();
	},
	buscarPorMatricula: function(e){
		e.preventDefault();
		this.error = app.AUT_NO_ERR
		
		var newMatricula = $.trim(this.$('.newMatricula').val());
		var yaExisteMatricula = false;
		
		if( newMatricula == '' )
		{
			this.state = app.AUT_STATUS_LISTO_NO_MAT;
			//this.error = app.AUT_MAT_YA_EN_LISTA;
			this.renderHeader();
		}
		else
		{
			this.collection.forEach( function(model){
				if(model.get('numeroMatricula') == newMatricula)
					yaExisteMatricula = true
			} );
			
			if(yaExisteMatricula == true){
				this.state = app.AUT_STATUS_LISTO_NO_MAT;
				this.error = app.AUT_MAT_YA_EN_LISTA;
				this.renderHeader();
			}
			else{
				var url = this.ajaxUrl;
				var context = this;
				
				$.ajax({
					type: "POST",
					url: url + "/" + newMatricula,
					beforeSend: function( _jqXHR, _settings ){
						context.state = app.AUT_STATUS_PROCESANDO;
						context.error = app.AUT_NO_ERR;
						context.renderHeader();
					},
				}).done(function(_data,_status,_jqXHR){
					try{
						if(_data.status == "OK"){
							context._newMatricula = _data.object.numeroMatricula;
							context._newNombreCompleto = _data.object.nombre + " " + _data.object.primerApellido + " " + _data.object.segundoApellido;
							
							context.state = app.AUT_STATUS_LISTO_MAT;
							context.error = app.AUT_NO_ERR;
							context.renderHeader();
						}
						else{
							context.state = app.AUT_STATUS_LISTO_NO_MAT;
							context.error = app.AUT_MAT_NOT_FOUND;
							context.renderHeader();
						}
					}
					catch(err){
						context.state = app.AUT_STATUS_LISTO_NO_MAT;
						context.error = app.AUT_SERVER_ERROR;
						context.renderHeader();
					}
				});	
			}
		}
	},
});

