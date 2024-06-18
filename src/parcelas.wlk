import semillas.*
class Parcela {
	var ancho
	var largo
	const property horasDeSolAlDia=0
	var plantasQueTiene =[]
	
	method superficie()= ancho*largo
	method cantidadMaxPlantasQueTolera(){
		if (ancho>largo){return self.superficie()/5}
		else{return self.superficie()/3 + largo}
	}
	method tieneComplicaciones()= plantasQueTiene.any{p=> p.horasDeSolQueAguanta()< horasDeSolAlDia}
	method plantarPlanta(unaPlanta){
		if (plantasQueTiene.size()+1>self.cantidadMaxPlantasQueTolera()){
				self.error("se alcanzo la cantidad máxima permitida de plantas en la parcela")
			}
		else if (horasDeSolAlDia> unaPlanta.horasDeSolQueAguanta()+2){
			self.error("la planta no tolera las horas de sol recibidas en la parcela")
		}
		else{plantasQueTiene.add(unaPlanta)}
	}
	method tieneSueloExtenso()= self.superficie()>6
	method tienePlantasBajas()= plantasQueTiene.all{p=> p.altura()<=1.5}
	method cantidadDePlantas()= plantasQueTiene.size()
	method esMonocultivo()= self.cantidadDePlantas()==1
	method seAsociaBien(unaPlanta)
	method cantidadBienAsociadas()= plantasQueTiene.count{p=> self.seAsociaBien(p)}
	
	}
	
class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta)= not self.tieneComplicaciones() &&
	unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta) = self.cantidadDePlantas()<=2 && unaPlanta.esFuerte()
}
