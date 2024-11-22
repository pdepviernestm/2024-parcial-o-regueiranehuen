class Persona{
    var emociones = []
    var edad
    method esAdolescente(){
        return edad >= 12 || edad < 19
    }
    method agregarEmocion(emocion){
        emociones.add(emocion)
    }


}
