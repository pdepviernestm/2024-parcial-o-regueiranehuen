class Emocion{
    var intensidad=0 // Por default
    var numElevada

    method intensidad()=intensidad

    // Num es un valor arbitrario que elijo yo
    method intensidadElevada()=intensidad > numElevada
}

class Furia inherits Emocion{
    
    method intensidadInicial(){
        intensidad = 100
    }

    var palabrotas = []

    method puedeLiberarse(persona){
        return self.intensidadElevada() && palabrotas.any({p=>p.size() > 7})
    }

    method liberarse(evento){
        intensidad -= evento.impacto()
        palabrotas.remove(palabrotas.first())
    }

}

class Alegria inherits Emocion{
    
    



    method puedeLiberarse(persona){
        
    }

    method liberarse(evento){

    }

}
