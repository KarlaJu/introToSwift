import Cocoa

let main = DispatchQueue.main
let background = DispatchQueue.global()

func doSyncWork() {
    //Usamos los queue pero sigue siendo secuencial con sync
    //con async manda light al queue pero sigue ejecutandose en backgroung
    background.async {
        for _ in 1...3 {
            print("Light")
        }
    }
    for _ in 1...3 {
        print("Heavy")
    }
}

doSyncWork()

let asianWorker = DispatchQueue(label: "costruction_worker_1" )
let brownWorker = DispatchQueue(label: "costruction_worker_2")

func doLightwork() {
    asianWorker.async {
        for _ in 1...10 {
            print("👷‍♂️")
        }
    }
    brownWorker.async {
        for _ in 1...10 {
            print("👷🏽‍♂️")
        }
    }
}
doLightwork()

/*
 userIntercative (higest priority)


 */

//GCD

//De aqui para abajo es operation


let printerOperation = BlockOperation()


printerOperation.addExecutionBlock { print("I") }
printerOperation.addExecutionBlock { print("am") }
printerOperation.addExecutionBlock { print("printing") }
printerOperation.addExecutionBlock { print("bock") }
printerOperation.addExecutionBlock { print("operation") }

printerOperation.completionBlock = {
    print("I'm done")
}


let operationQueue = OperationQueue()
operationQueue.addOperation ( printerOperation )
