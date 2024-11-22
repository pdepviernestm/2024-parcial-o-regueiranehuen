// Muchas veces pasa que al liberarse la emoción, algo se altera en ella que hace que no pueda volver a liberarse ante un próximo evento. 
import personas.*
import eventos.*
class Emocion{
    var intensidad=0 // Por default
    var valorElevada // 5)
    var cantEventos = 0
    var puedeVolverALiberarse = true // Inicializada en true


    method cantEventos()=cantEventos

    method intensidad()=intensidad

    // Num es un valor arbitrario que elijo yo
    method intensidadElevada()=intensidad > valorElevada

    method puedeLiberarse(persona){
        return self.intensidadElevada() && puedeVolverALiberarse
    }
    method liberarse(evento){
        intensidad -= evento.impacto()
    }

    method alLiberarse(evento){
        return intensidad - evento.impacto()
    }

    method agregarEvento(){
        cantEventos+=1
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
        return super(persona) && self.cantEventos().even()
    }

    override method liberarse(evento){
        intensidad = 0.max(self.alLiberarse(evento)) // >= 0        
    }

}

class Tristeza inherits Emocion{

    var causa = self.causaInicial()



    method causaInicial()="melancolia"

    method setCausa(nuevaCausa){
        causa=nuevaCausa
    }

    override method puedeLiberarse(persona){
        return super(persona) && causa != "melancolia"
    }

    override method liberarse(evento){
        super(evento)
        causa = evento.descripcion()
    }

}

class DesagradoYTemor inherits Emocion{
    override method puedeLiberarse(persona){
        return super(persona) && self.cantEventos() > intensidad
    }
}

// Con inherits heredo los atributos y métodos de la clase Emocion
class Ansiedad inherits Emocion{

    // Nuevo valor
    var nivelAnsiedad

    method nivelAnsiedad()=nivelAnsiedad

    // Nuevo cálculo que determina si la ansiedad puede liberarse
    method coeficienteAnsiedad() = nivelAnsiedad ** 2 + cantEventos / 2
    
    
    // Sobreescribo al método puedeLiberarse de la clase padre (Emocion) y lo llamo mediante el método super pasándole la persona por parámetro
    override method puedeLiberarse(persona){
        return super(persona) && self.coeficienteAnsiedad() > intensidad // Nueva condición para que pueda liberarse
    }

    // Sobreescribo el método liberarse de la clase padre
    override method liberarse(evento){
        // Nuevamente utilizo el método super pero para el método liberarse, pasando el evento por parámetro
        super(evento)
        nivelAnsiedad -= intensidad // Restarle al nivel de ansiedad la intensidad que fue modificada por el método liberarse de la clase Emoción
    }

}
