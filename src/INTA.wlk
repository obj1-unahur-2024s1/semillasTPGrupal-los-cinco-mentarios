import semillas.*
import parcelas.*

object inta{
	const parcelas=[]
	
	method promedioDePlantas()= parcelas.sum{p=> p.cantidadDePlantas()}/parcelas.size()
	method laMasAutosustentable() = 
	parcelas.map({p=> p.cantidadDePlantas()>4}).max({p=> p.cantidadBienAsociadas()})
}