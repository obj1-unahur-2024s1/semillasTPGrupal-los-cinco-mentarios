import parcelas.*

class Plantas{
	var anioDeObtencion=0
	var property altura
	var horasDeSolQueAguanta=0
	 
	
	method horasDeSolQueAguanta()= horasDeSolQueAguanta
	method esFuerte(){return self.horasDeSolQueAguanta() >10}
	method daNuevasSemillas(){return(self.esFuerte()||self.condicionAlternativa())}
	method cuantoEspacioOcupa()=0
	method esReciente()= anioDeObtencion >2007
	method condicionAlternativa()
	method esParcelaIdeal(unaParcela)
}

class Menta inherits Plantas{
	override method horasDeSolQueAguanta()= 6
	override method condicionAlternativa()= self.altura()>0.4
	override method cuantoEspacioOcupa()= self.altura()*3
	override method esParcelaIdeal(unaParcela)= unaParcela.tieneSueloExtenso()
}
class Hierbabuena inherits Menta{
	override method cuantoEspacioOcupa()= super()*2
}

class Soja inherits Plantas{
	override method horasDeSolQueAguanta(){
		if (altura<0.5) {return 6}
		else if (altura.between(0.5, 1)){return 7}
		else {return 9}
	}
	override method condicionAlternativa()= self.esReciente() && self.altura()>1
	override method cuantoEspacioOcupa()= altura/2
	override method esParcelaIdeal(unaParcela)= unaParcela.horasDeSolAlDia()
	== self.horasDeSolQueAguanta()
}
class SojaTransgenica inherits Soja{
	override method daNuevasSemillas()=false
	override method esParcelaIdeal(unaParcela)= unaParcela.esMonocultivo()
}
class Quinoa inherits Plantas{
	method horasDeSolQueAguanta(horas){horasDeSolQueAguanta=horas}
	override method cuantoEspacioOcupa()=0.5
	override method condicionAlternativa()= anioDeObtencion<2005
	override method esParcelaIdeal(unaParcela)=unaParcela.tienePlantasBajas()
	
}