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

//Se crea una copia para Juan no por referencia
var juan = Persona()
juan.cuerpo = cuerpo
cuerpo.altura = 1.85
cuerpo.peso = 70
print("Juan es \(juan.cuerpo.altura) metros alto y pesa \(juan.cuerpo.peso)")
print(cuerpo)

//Se hereda de persona con los dos puntos
class Empleado: Persona {
    var idEmpleado = 0
}

var empleado = Empleado()
empleado.cuerpo = cuerpo
empleado.idEmpleado = 2


var c1 = Cuerpo()
c1.altura = 1.3
let c2 = Cuerpo()

var c3 = c2
c3.altura = 30
print(c2)

//Si se habla de estructuras es porque estamos pasando copias

let e = Empleado()
let otroE = Empleado()
//Lo que chehca es que si estamos haciendo referencia al mismo objeto
e === otroE  //Esto es falso

let e1 = Empleado()
let otroE1 = e1
//Lo que chehca es que si estamos haciendo referencia al mismo objeto. Revisa si esta exactamente en el mismo lugar en la memoria
e1 === otroE1  //Esto es falso

//No puede haber dos variables que puedan
//Se esta haviendo una copia
//Es imposible que se pueda pasar
//Una vez que se hace la asignacion, se esta creando una copia de la estructura
//Es semanticamente imposible que en estructuras eso pueda pasar
//let c = Cuerpo()
//let otroC = Cuerpo()
//c === otroC


//Propiedades almacenadas y calculadas
struct Cuerpo1 {
    var altura: Double  = 1.73 //propiedades con almacenamiento y valor por default
    var peso: Double = 75
}


//Calculadas: Estas proppiedades no tienen un espacio para almacenar valor simplemente lo calculan
class Persona1 {
    var cuerpo: Cuerpo1 = Cuerpo1()
    var bmi: Double {
        get {
            return (cuerpo.peso/(cuerpo.altura * cuerpo.altura))
        }
    }
}


var persona1 = Persona1()
persona1.cuerpo = Cuerpo1()
print("El bmi de la persona es: \(persona1.bmi)")



//La propiedad
class Empresa {
    var numeroEmpleados: Int = 0 {
        willSet {//Monitoreando u observando si una propiedad cambia, se ejecutara antes de que yo cambie el valor de la propiedad
          print("Tenemos \(numeroEmpleados) y vamos a tener \(newValue) empleado") // swift sintetiza e inclye newValue
        }
        didSet {//Depsues de que el cambio se hizo
          print("Ahora tenemos \(numeroEmpleados) y teniamos \(oldValue) empleados") // el valor previo que se tenia
        }
    }
}

var empresa = Empresa()
empresa.numeroEmpleados = 2



//Funciones
//Se pueden asignar a los enmus, a las estructuras y a las clases
//en el caso de las clases el mutating viene por default
struct Cuerpo3 {
    var altura: Double = 0 //propiedades con almacenamiento y valor por default
    var peso: Double = 0
    mutating func subirDePeso(kilos: Double) { //Aqui si le tenemos que indicar que el valor va estar mutando
        peso = kilos
    }
}
var cuerpo3 = Cuerpo3()
cuerpo3.subirDePeso(kilos: 23)

var cuerpo4 = Cuerpo3()
cuerpo4.subirDePeso(kilos: 12) // solo se pueden mandar a llamar como var, ya que si son let al ser de tipo mutating mandara error


class Persona2 {
    var cuerpo: Cuerpo3 = Cuerpo3()
}

class Empleado2: Persona {
    var idEmpleado = 0
    func asignar(id: Int) {
        idEmpleado = id
    }
}
let empleado2 = Empleado2() //esto puede ser de tipo inmutable
empleado2.asignar(id: 12)  //Y sin empbargo sus funciones internamente pueden modificarse !!! Advetencia se recomienda tener con eso
//El hecho de poner let no quiere decir que no se pueda modficar la parte interna del objeto
print("\(empleado2.idEmpleado)")


class Persona3 {
    static let pesoDefault = 20 //Metodos de instancia no de clase
    var cuerpo: Cuerpo3 = Cuerpo3()
    static func devuelvePesoDefault() -> Int {
        return pesoDefault
    }
}

let pesoDefault = Persona3.devuelvePesoDefault()


//Extensiones


//Propiedades almacenadas y calculadas
struct Cuerpo4 {
    var altura: Double  = 1.73 //propiedades con almacenamiento y valor por default
    var peso: Double = 75
}

//Se vuelve a abrir la declaracion de cuerpo
//Para agregarle propeidades
//Se pueden tener varias extensiones
extension Cuerpo4 {
    var bmi: Double {
        get {
            return (cuerpo.peso/(cuerpo.altura * cuerpo.altura))
        }
    }
}


//var cuerpo4 = Cuerpo4()
//cuerpo4.bmi()





struct Point {
    let x: Double
    let y: Double
}

print(Point(x:1,y:2))

//Description es el equivalente a toString
extension Point: CustomStringConvertible {
    var description: String {
        return "This point \(x) :\(y)"
    }
}



//Protocolos
//Es lo mismo que el concepto de interfaz
//Describe las firmas, un contrato y las clases y las estructuras implementan el contrato que esta especificadoe en ese protocolo
//Los protocolos tambien pueden heredar de otro protocolo
protocol EventoType {
    var titulo: String {get set}
    var id: Int {get}
    func creaNotificacionLocal()
}

class EventoCalendario: EventoType {
    var titulo: String = " "
    var id: Int = 0
    func creaNotificacionLocal(){
        //Algo aqui
    }
}

//Herencia de protocolos
protocol EventoEspecialType: EventoType {
    var esEspecial: Bool {get}
}





//Clousers
let numbers = [2,1,31,3,56,42,14]

func compareAscending(i: Int, j: Int) -> Bool{
    print("i: \(i) < j: \(j)")
    return i < j
}

//Sorted es una funcion de orden superior
//Las funciones también es un tipo de dato
//Pueda pasar o devolver una funcion y esas se llaman de orden superior
let sortedNumbers = numbers.sorted(by: compareAscending) //Sorted funciona a traves de una funcion, toma la funcion y los ordena

//Funcion anonima
let sortedNumberAnonima = numbers.sorted(by: {
    (i: Int, j:Int) -> Bool in
    return i < j
})


let mappedNumbers = numbers.map { // recibe una funcion
    (i: Int) -> Int in  //se puede cambiar por string y retornar simplemante el "valor"
    //return "\(1*2)"
    return i * 3
}
mappedNumbers


//Ejemplo de clouser

typealias myFunction = (String) -> () //se crea un aleas para hacer mas legible el código

func reatPrint (times: Int) -> myFunction { //De vuelve una funcion (La funcion devuelve void) Es una fabrica de funciones
    func printer(text: String) { // retiene el valor de una variable que ya debio de ser destruida, esto es una operacion de cerradura
        for _ in 1...times {
            print(text)
        }
    }
    return printer
}

let log = reatPrint(times: 5)
let log2 = reatPrint(times: 2)
log("Yeah")
log2("Ok")



//Genericos
//En estas funciones es exactamente lo mismo, solo cambian el tipo de dato

func makeIntPair(x: Int, y: Int) -> (Int, Int) {
    return(x,y)
}

func makeStringPair(x: String, y: String) -> (String, String) {
    return(x,y)
}

//Entonces hacemos una funcion generica
func makePair<T>(x: T, y: T) -> (T, T) {  //Va a trabajar con un tipo de dato llamado T, no necesariamente tiene que ser una letra
    return (x,y)
}

let firstPair = makePair(x: 1, y: 2)
let secondPair = makePair(x: "uno", y: "dos")
//Esto hace que las demas no nos funcionen, con makePair tenemos una funcion generica que utilizamos con diferentes tipos de datos
//El compilador en tiempo de compilacion, reemplaza T por el tipo de dato que le estoy mandando
//Cuando lo compila va a crear una funcion que recive el tipo de dato
//se convierte en una especie de template
//Para crear versiones especificas cuando lo mande a llamar

func makePairDifferent<T,U>(x: T, y: U) -> (T, U) {
    return (x,y)
}
let firstPairDifferent = makePairDifferent(x: 1, y: "dos")



//Se recomienda que siempre sea siemple, las funciones entre más simple mejor. Solo si despues se requiere, pero de entrada siempre tiene que ser simple



//Manejo de errores
func miFuncion() throws {}

try miFuncion() //No es un bloque, si no que indica que va a manadar a llamar una funcion que puede mandar una excepcion


do { //Es mas parecido al try de java
    try miFuncion() //solamente la lineas que pueden generar la exception son marcadas con try
} catch {
    print(error)
}



enum MiError: Error { //Pueden implementar protocolos
    case Malo
    case Peor
    case MuchoPeor
}

func infalible(val: Int) -> String {
    return "perfecto"
}

func falible(error: Bool) throws -> String {
    if error {
        throw MiError.Peor
    }
    return "Casi perfecto"
}


//En la logica vemos que se puede manejar como switch
do {
    infalible(val: 2)
    try falible(error: true)
    print("Todo bien")
} catch MiError.Malo {
    print("Mal")
} catch MiError.Peor {
    print("Peor")
} catch MiError.MuchoPeor{
    print("Corraaaaan")
}

//try! falible(error: true) //En ejecucion
//try falible(error: true) //En compilacion
try? falible(error: true) //Como opcional
