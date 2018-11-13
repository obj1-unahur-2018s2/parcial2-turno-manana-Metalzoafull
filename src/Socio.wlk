import mutal.*
import libro.*
class Socio {
	 var property edad
	 var idiomas = #{}
	 var property maximoActividad
	 var actividades = []
	 method retornaI(){return idiomas}
	 method agregarIdioma(idio){idiomas.add(idio)}
	 method aderirActividad(actividad){if(actividades.size() >= self.maximoActividad())
	 	{assert.error("superaste el cupo de actividades")}
	 	else{actividades.add(actividad)}
	 }
	 method adorarorSol(){return actividades.all({activi=>activi.broncearse()})}
	 method actividadEsforzada(){return actividades.filter({activi =>activi.implicaEsfuerzo()})}
	 method leAtrae(actividad){return "no definido"}
}

class Tranquilo inherits Socio{
	 override method leAtrae(actividad){return actividad.actividadDias() >= 5}
}
class Coherente inherits Socio{
	var property adora
	 override method leAtrae(actividad){if(self.adora())
	 	{return self.adora()==actividad.broncearse()}
	 	else{return self.adora()==actividad.implicaEsfuerzo()}
	 }
}
class Relajado inherits Socio{
	 override method leAtrae(actividad){return actividad.idioma().any(idiomas.contains())}
}