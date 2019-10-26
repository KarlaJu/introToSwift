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



//Valores por defecto
func saludar7(persona: String = "Norberto") {
    print("Hola \(persona)")
}
saludar7(persona: "Karla")
saludar7()

//Para que devuelva un tipo string
func saludar8(persona: String = "Norberto") -> String {
    print("Hola \(persona)")
    return "Saludos a \(persona)"
}

let persona = saludar8(persona: "Raul")
saludar8()
persona


let unEntero = 10
let otroEntero: Int = unEntero.advanced(by: 1) //Permite incrementar por 1 por 2 ... n
print("\(otroEntero)")


let unEntero2: Int? = 10
let otroEntero2: Int = unEntero2!.advanced(by: 1) //Este caso es cuando podría ser opcional
print("\(otroEntero)")



//Opcionales
//Casos con opcionales

let unEntero3: Int? = 10
let otroEntero3: Int = unEntero3?.advanced(by: 1) ?? 0 //Este es el valor que va a tener po defailt si es que la caja viene vacia
print("\(otroEntero)")


var librosFavoritos: [String] = []
//Para forzar a que no sea opcional
let valor: String = librosFavoritos.first ?? "Programming swift" //First devuleve un pocional
//Si solo se declara
//let valor = librosFavoritos.first // Esto se vuelve un opcional
