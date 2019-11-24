import Cocoa

//variables
var unEntero: Int

unEntero = 10

//Variable inicializada
var otroEntero: Int = 8

// mas información en la barra, aún más en el toogle y aún má en el ojo
//El compilador trata de leer de que tipo es la variable

var segundoEntero = 8
// el compilador ni siquiera va a compilarlo: segundoEntero = "asda"
//Una vez defino el tipo de la variable no se puede cambiar


//Constantes
//Cuando se pone let, una vez que la varialbe tenga let ya no puede cambiar el valor de la variable
let unaConstante = 8

//-------Una recomendación es que se utilice más bien let siempre, hay casos en los que se necesita usar var pero es mejor usar let

//Cadenas
let cadena: String = "Mi cadena"
let unaCadena = "Una cadena"
//Tiene soporte de unicode
let cadena2 = "Mi ca\u{301}dena"
//También los entiende de esta manera
let cadena3 = "Mi cádena"

//Tiene autocompletado
cadena.count
cadena2.count
//De esta manera el unicode lo separa y nos regresa ambos caracteres separados
cadena2.unicodeScalars.count



//Estructuras de control
for index in cadena2.indices {
    print("La salida es: \(cadena2[index])")
}
//Lo que me devulve indices es un iterador


//La igualdad va a ser de contenido,  no compara que sea exactamente el mismo objeto
if cadena2 == cadena3 {
    print("Son iguales")
}

//El valor por default de un int es de 64 bits
print("El valor máximo de Int es \(Int.max).")
print("El valor mínimo de Int es \(Int.min).")
print("El valor máximo de UInt es \(UInt.max).")
print("El valor mínimo de UInt es \(UInt.min).")
print("El valor máximo de Int8 es \(Int8.max).")
print("El valor máximo de Int16 es \(Int16.max).")
print("El valor máximo de Int32 es \(Int32.max).")
print("El valor máximo de Int64 es \(Int64.max).")

print(11/3) //Un entero
print(11 / 3.0)// Hace el casteo y regresa un contraenteero
print(11 % 3) // El modulo


let y: Int8 = 120 //Si el valor de un int8 es un 128 se genera un overflow
//let z = y + 10 // genera un error de ejecucion, si lo compilo, le esta poniendo un tipo de datos int8 a la variable
let z = y &+ 10 // El & indica que swift se comporte como c, genera un overflow pero el resultado es -126



//Los float son de 32 y los doubles son de 64 bits
let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3


//Lo que hace es que toma la notacion cientifica y al momento de regresar la notacion pierde presicion
print("d1 + 0.1 es \(d1 + 0.1)")
//Nunca usar flotantes o doubles para guardar dinero


//Jamas se deben de compara iguales o doubles, porque no son iguales y muy dificilmente van a cuadrar
//Se almacena en notacion cientifica y NO son iguales
if d1 + 0.1 == 1.2 {
    print("Son iguales")
}



//Tuplas
let codigoError = (404, "Not Found")
print(codigoError)
//De esta manera se puede acceder a una tupla sin descripcion
print(codigoError.0)


//Se puede agregar el nombre a la tupla
let codigoError2 = (code: 404, description: "Not Found")
print(codigoError2.description)

//Esta linea funciona como pattern Matching
//Funciona mas bien como una afirmacion
//Y lo que esta del lado izquierdo es igual a lo que tengo del lado derecho
//Se de-estructura para poder extraer valores
let (codigo, mensaje) = codigoError
print("\(codigo) : \(mensaje)")

let (_, mensaje2) = codigoError //De esta manera no importa recuperar el primer elemento, el único que importa es el segundo

let codigoError3 = (404, "Not found", "Otro mensaje")
let (_,_,mensaj3) = codigoError3
print(mensaj3)



var bandera = 1
while bandera == 0 {
    print("Bandera no ha cambiado")
}



//Soporta if terniarios


//No importa el tipo de dato, el swith lo soporta
//Tampoco tiene break
let personaje: String = "Lobo estepario"
switch personaje {
case "Caballero":
    print("El personaje \(personaje) es un caballero")
case "Mago":
    print("El personaje \(personaje) es un Mago")
case let unPersonaje where unPersonaje.hasPrefix("Lobo") &&
unPersonaje.hasSuffix("pario")://Si personaje asignado tiene prfijo lobo y el sufijo pario se asigne a la variable
    print("Wow El personaje \(personaje) es un Lobo")
default:
    print("Este no es un personaje del juego")
}
//En la medida de los posible evitar poner default en el switch
//Es porque a veces no se pone un print en el break y no arroja el error


// el case soporta rangos


//fallThrough va a hacr lo que tenga que hacer y se va seguir y va a entrar en el siguiente caso
var numero = 5
switch numero {
case 0...5:
    numero += 1
    fallthrough
case 6..<10:
  numero*=1
case 11:
    print("Hola")
    break
default:
    numero += 1
    print(numero)
}


//Solo puede tener enteros, no puede tener null. No copila si tiene valores nulos
//var x2: Int
//x2 + 1

//optionals
//Java tiene todas las variables opcionales
//En swift las variables no son opcionales
//Asi se declaran las variables opcionales en swift
var x3: Int?
x3 = 1
x3 = nil

//En este caso es como si en java todas estuvieran declarados de manera optional (?)
//var x4: Int
//x4 = 1
//x4 = nil
//Si le quitas el '?' no te deja c


//Esta es la solucion ganadora
let x: Int
x = 1

//Lo importante es que cuando se declara, es más explixito que puede venir null
var a: String?
var f: Float? = 1.0 //Si esto no se declara, truena en la ejecución

let flotante = f! + 1.9 //Con el signo de admiracion, es como una alerta, es para forzar a sacar valor
//Evitar optionals siempre

//
if let x = f { //clausula if let
     print("Todo bien \(x+1)") //Tambien se puede quedar con el if, sin laa necesidad de usar else
} else {
    print("El opcional no tiene valor")
}


var cadenaOpcional: String? = "10"
if let s = cadenaOpcional {
    if let i = Int(s) { // Aqui va la piramide de la muerte por muchos ifs
        print("El entero es \(i)")
    }
}

if let s = cadenaOpcional, let i = Int(s) { //Si es necesario que lleven las llaves, es un if que se aplana y que pueda tener varias sentencias
    print("Cadena es \(s); el entero es \(i)")
}



//Arreglos
var librosFavoritos1: [String] = ["Aprende Swift en 3 segundos",
"Elm para principiantes",
"Crea sitios increibles con Elixir"]

//Inferencia de tipos
var librosFavoritos = ["Aprende Swift en 3 segundos",
"Elm para principiantes",
"Crea sitios increibles con Elixir"]

librosFavoritos.count
librosFavoritos.first
librosFavoritos.last
librosFavoritos[1]

//Si presionas la tecla de option (alt) y das click en append te da la documentacion
librosFavoritos.append("Code complete")
librosFavoritos[2]
librosFavoritos.insert("The art of unix programming", at: 2)
librosFavoritos[2]
librosFavoritos.remove(at: 3)//Los parametros de las funciones son nombrados con al at

for libro in librosFavoritos {
    print(libro)
}

//enumerated devuelve un conjunto de tuplas
//Estoy haciendo un pattern matching con la tupla
for (indice, libro) in librosFavoritos.enumerated() {
    print("\(indice + 1) : \(libro)")
}




//Enums
//El case quiere decir QUE valores son permitidos
//Que valores puede tener esa variable
enum Dia {
    case Lunes
    case Martes
    case Miércoles
    case Jueves
    case Viernes
    case Sabado
}

//Restringo el tipo de dato, pero no el valor, el tipo de dato es String, el tipo de dato es dia
//El valor se puede cambiar simplemente con .valor del enum
var nombre: String
var diaSemana = Dia.Lunes
diaSemana = .Jueves

//El switch tiene que ser exahustivo, tiene que cubrir todos los casos
//Y en este caso no hay forma de que exista otra opcion de esos 5 valores
//Si te falta un caso el compilador te manda un error de que te falta un caso
//Porque no estas cumpliendo con todos los casos
// Inlcuso con un default tienes que completar todos los casos
//En el caso de poner un default ya contemplando todos los casos
//El compilador de dice que nunca va a entrar a ese caso
//Porque el enum no tiene ese valor
switch diaSemana {
case .Lunes:
    print("Otra vez a trbajar")
case .Martes:
    print("Ya quiero que acabe la semana")
case .Miércoles:
    print("Apenas vamos a la mitad")
case .Jueves:
    print("Ya casi es fin de semana")
case .Viernes:
    print("Por fin es viernes!!")
case .Sabado:
    print("Saaabado")
}


//Diccionarios
//Mapas
//Coleciones asociativas
var unDiccionario: [String:Int] = [:]
var diccionario = ["llave1": 1, "llave2": 2, "llave3": 3]

//Dentro de un valor se guarda el valor anterior
//Un valor es de tipo opcional
let unValor = diccionario.updateValue(4, forKey: "llave2")
diccionario["llave1"] = 10
//si 'llave' no se encuentra, la va a crear
diccionario
diccionario["llavee"] = 10
diccionario
//Cuando una llave es nula, la quita del mapa
//No se recomienda borrar llaves de esta manera
diccionario["llave3"] = nil
diccionario

//Si se quiere remover una llasve, se recomienda removerla de esta manera
//Si ves el nil, alguine mas no sabra de se trata
let llave2 = diccionario.removeValue(forKey:"llave1")
diccionario.removeValue(forKey:"llave2")
diccionario





//conjuntos
//colecciones no ordenadas

var amigos = Set<String>()
var amigos1: Set<String> = [] //Si se inicializa

var amigos2 = Set(["Julieta", "Violeta", "Andres", "Ernesto"])
var amigos3: Set = ["Fabian", "Freddy", "Andres", "Ernesto"]
amigos3.insert("Julian")
amigos3
//En este caso se remueve el valor como tal
amigos3.remove("Ernesto")
amigos3
//No acepta duplicados
//Regresar una isercion falsa
amigos3.insert("Julian")
amigos3

//No hay que perder de vista que no hay garantia de orden
for amigo in amigos3 {
    print("\(amigo) es mi amigo")
}

let estaVacio = amigos3.isEmpty
let estaAndres = amigos3.contains("Andres")
let numeroAmigos = amigos3.count

//podemos pedir intersecciones y diferencia de interesecciones y la union
let comunes = amigos2.intersection(amigos3)
let diferencias = amigos2.symmetricDifference(amigos3)
let todos = amigos2.union(amigos3)
let resta = amigos2.subtract(amigos3)  //prints: ()
let resta2 = amigos2.subtracting(amigos3)  //prints: {'Julieta', 'Violeta', 'Ernesto'}
