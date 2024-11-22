import eventos.*
class Persona{
    var emociones = []
    var edad

    // 1)
    method esAdolescente(){
        return edad >= 12 && edad < 19
    }

    // 2)
    method agregarEmocion(emocion){
        emociones.add(emocion)
    }

    // 3)
    method estaPorExplotarEmocionalmente(){
        return emociones.all({emocion=>emocion.puedeLiberarse(self)})
    }

    // 4)
    method vivirEvento(evento){
        emociones.forEach({emocion=>emocion.agregarEvento()})

        var emocionesPuedenLiberarse = emociones.filter({emocion=>emocion.puedeLiberarse(self)})
        emocionesPuedenLiberarse.forEach({emocion=>emocion.liberarse(evento)})
    }


}

class Grupo{
    var integrantes = []

    // 6)
    method vivirMismoEvento(evento){
        integrantes.forEach({integrante=>integrante.vivirEvento(evento)})
    }

}
