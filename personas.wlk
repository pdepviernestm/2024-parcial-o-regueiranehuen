class Persona{
    var emociones = []
    var edad
    var cantEventos = 0

    method esAdolescente(){
        return edad >= 12 || edad < 19
    }
    
    method cantEventos()=cantEventos

    method agregarEmocion(emocion){
        emociones.add(emocion)
    }

    

}
