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
        emociones.forEach({emocion=>emocion.puedeLiberarse(self)
                            emocion.liberarse(Evento)})
    }

}

class Grupo{
    var integrantes = []

    // 6)
    method vivirMismoEvento(evento){
        integrantes.forEach({integrante=>integrante.vivirEvento(Evento)})
    }
}
