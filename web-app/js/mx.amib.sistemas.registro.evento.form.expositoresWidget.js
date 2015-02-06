var app = app || {};

app.Expositor = Backbone.Model.extend({
	defaults: {
		idx: -1, 
		grailsId:-1,
		segundoApellidoExpositor: '',
		primerApellidoExpositor: '',
		nombreExpositor: '',
	}
});

app.Expositores = Backbone.Collection.extend({
	model: app.Expositor
});


app.ExpositorView = Backbone.View.extend({
	tagName: 'tr',
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
})

app.ExpositoresView = Backbone.View.extend({
	el: '#tbdyExpositores', 
	
	_segundoApellidoExpositor: '',
	_primerApellidoExpositor: '',
	_nombreExpositor: '',
	
	template: _.template( $('#newExpositorTemplate').html() ),
	
	
	initialize: function( initialExpositores ){
		this.collection = new app.Expositores(initialExpositores); 
		console.log("paso aqui, hay collecion: " + this.collection );
		this.render();
		this.listenTo( this.collection, 'add', this.renderExpositor ); 
	},

	render: function(){
		this.collection.each ( function(item){
		this.renderExpositor(item)
		}, this );
	},


	renderExpositor: function(item){
	var expositorView = new app.ExpositorView({model:item});
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
		var expositor = new app.Expositor( { horas: _horas ,  segundoApellidoExpositor: _segundoApellidoExpositor , primerApellidoExpositor: _primerApellidoExpositor , nombreExpositor: _nombreExpositor , idx: _idx } );

		this.collection.add(expositor);
			}
	});

				

					


