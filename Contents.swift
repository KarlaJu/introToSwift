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
