import Socio.*
import libro.*
class Viajes {
	var idiomas = #{}
	method idioma(){return idiomas}
	method definirIdioma(idioma){idiomas.add(idioma)}
	method actividadDias()
	method implicaEsfuerzo()
	method broncearse()
	method esInteresante(){return idiomas.size() > 1}
	method recomendacion(socio){return self.esInteresante()
		and socio.leAtrae()
		and socio.contains(not self)
	}
}

class Viajes_playa inherits Viajes{
	var property largoPlaya
	override method actividadDias(){return self.largoPlaya()/500}
	override method implicaEsfuerzo(){return self.largoPlaya() > 1200}
	override method broncearse(){return true}
}
class Excurcion_ciudad inherits Viajes{
	var property atracciones
	override method actividadDias(){return self.atracciones()/2}
	override method implicaEsfuerzo(){return self.atracciones() >= 5 and self.atracciones() <= 8}
	override method broncearse(){return false}
	override method esInteresante(){return
		super()
		or self.atracciones() == 5
	}
}

class Excuciones_tropical inherits Excurcion_ciudad{
	override method actividadDias(){return (self.atracciones()/2)+1}
	override method broncearse(){return true}
}

class Trekking inherits Viajes{
	var property kilometros
	var property solAnio
	override method actividadDias(){return self.kilometros()/50}
	override method implicaEsfuerzo(){return self.kilometros() > 80}
	override method broncearse(){return
		self.solAnio() > 200 or self.solAnio() > 100 and self.solAnio() < 200 and self.kilometros() > 120
	}
	override method esInteresante(){return 
		super()
		and self.solAnio() > 140
	}
}

class Gimnasia {

	method recomendacion(socio){socio.edad() >= 20 and socio.edad() <= 30}
	method idioma(){return "Español"}
	method actividadDias(){return 1}
	method implicaEsfuerzo(){return true}
	method broncearse(){return false}
}

class Taller inherits Viajes{
	var libro = []
	method aderirLibro(lib){libro.add(lib)}
	method idiomasUsados(){return libro.all({lib=>lib.idioma()})}
	override method actividadDias(){return libro.size()+1}
	override method implicaEsfuerzo(){return libro.filter({lib=>lib.paginas() > 500})
		//or me rendi
	}
	override method recomendacion(socio){return socio.idiomas().size() > 1}
	
}

