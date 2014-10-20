package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

import mx.amib.sistemas.cursoseventos.cursos.model.Cursos
class TipoCurso {
	
	String descripcion
	Boolean vigente
	
	
	static hasMany = [cursos: Cursos]
	static mapping = {
		
		table 't017_c_tpcurso'
		id generator:'identity'
		version false
		
		descripcion column:'ds_tpcurso'
		vigente column:'st_vigente'
		
	}
	
	

    static constraints = {
		vigente nullable: true
		descripcion nullable: true, maxSize:100
		
    }
}
