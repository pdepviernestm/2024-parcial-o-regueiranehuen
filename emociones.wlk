class Emocion{
    var intensidad=0 // Por default
    var numElevada

    method intensidad()=intensidad

    // Num es un valor arbitrario que elijo yo
    method intensidadElevada()=intensidad > numElevada

    method puedeLiberarse(persona){
        return self.intensidadElevada()
    }
    method liberarse(evento){
        intensidad -= evento.impacto()
    }

}

class Furia inherits Emocion{
    
    method intensidadInicial(){
        intensidad = 100
    }

    var palabrotas = []

    override method puedeLiberarse(persona){
        return super(persona) && palabrotas.any({p=>p.size() > 7})
    }

    override method liberarse(evento){
        super(evento)
        palabrotas.remove(palabrotas.first())
    }

}

class Alegria inherits Emocion{

    override method puedeLiberarse(persona){
        return super(persona) && persona.cantEventos().even()
    }

    override method liberarse(evento){
        
        intensidad = 0.max(super(evento)) // >= 0
        
    }

}

class Tristeza inherits Emocion{

    var causa = self.causaInicial()

    method causaInicial()="melancolia"

    override method puedeLiberarse(persona){
        return super(persona) && causa != "melancolia"
    }

    override method liberarse(evento){
        super(evento)
        causa = evento.descripcion()
    }

}
