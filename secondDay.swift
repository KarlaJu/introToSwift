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


//Enums
//Casos particulares

//Tienen valores por omision y ese valor es entero
enum EstadoDocumento: Int {
    //el valor que realmente va a tiene por dentro es
    //0 ,1,2,3
    //Al final del dia van a ser nombres que identidfican el valor
  case Recibido = 0, validado, EnProceso, Publicado
}

let valorEstado  = EstadoDocumento.validado.rawValue  //Imprime: 1, con rawvalue se saca el valor en crudo
//estado es de tipo estadoDocumento
let estado = EstadoDocumento(rawValue: 2) //Imprime EnProceso. Con esto podemos sacar un valor de estado documento con su valor en crudo
let estado2 = EstadoDocumento(rawValue: 4) //Estado2 es de tipo opcional, porque no hay garantia. En este caso es nil.


//siempre se deben poner una capa para recibir datos
//encodebo: para leer jsons
//Validador o sanidador
//montar un snifer para leer trafico de la red y realmente cómo esta mandando la peticion y cómo la recibe


//Esto podría funcionar cuando un servicio responde
//Para el primer filtro de la capa de defensa
//Con esto validamos que se recibio bien
enum ResultadoWebService {
    case Exito(String)
    case Error(Int)
}

func llamadaWs() -> ResultadoWebService {
    if false {
        return ResultadoWebService.Exito("Mi contenido")
    } else {
        return ResultadoWebService.Error(502)
    }
}

let resultado: ResultadoWebService = llamadaWs()
switch resultado {
case let .Exito(contenido):
    print(contenido)
case let .Error(codigo):
    print("El código de es es \(codigo)")
}


//Estructuras

//Las estructuras no soportan herencia
//van a pasarse por valor no por referenecia

struct Cuerpo {
    var altura: Double = 0
    var peso: Double = 0
}

//Clases
class Persona {
    var cuerpo: Cuerpo = Cuerpo()
}

//dee sta manera se inicializa
//Inicializador en lugar de constructor
var cuerpo = Cuerpo()
cuerpo.altura = 1.85
cuerpo.peso = 70


var juan = Persona()
juan.cuerpo = cuerpo
cuerpo.altura = 1.85
cuerpo.peso = 70
print("Juan es \(juan.cuerpo.altura) metros alto y pesa \(juan.cuerpo.peso)")
