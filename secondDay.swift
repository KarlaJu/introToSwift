import Cocoa

//Funcion sin parametros
func saludar() {
    print("Hola")
}
//See manda a llamar sin ningun problema
saludar()

//Funcion con parametros
func saludar2(persona: String) {
    print("Hola \(persona)")
}
saludar2(persona: "Kara")
 


//Es mas recomendable poner el nombre
//Si se le pone el guion bajo es para no mandarle el nombre del parametro
func saludar3(_ persona: String) {
    print("Hola \(persona)")
}
saludar3("Karla")

//Swift soporta multiples parametros
//Puede recibir varios parametros indefinidos
//Regreesa un arreglo(?)
func saludar4(personas: String ...) {
    print("Hola \(personas)")
}
saludar4(personas: "Karla", "Juan")

//Se puede poner con un for:
func saludar5(personas: String ...) {
    for persona in personas{
      print("Hola \(persona)")
    }
}
saludar5(personas: "Karla", "Juan")



func saludar6(persona: String, saludo: String) {
    print("Hola \(persona) \(saludo)")
}
saludar6(persona: "Karla", saludo: "buenos días")
