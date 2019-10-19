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
    print("\(cadena2[index])")
}
