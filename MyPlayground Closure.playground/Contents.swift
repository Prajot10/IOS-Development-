import UIKit

/*func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    
    return operation(n1, n2)
}


func add (no1: Int, no2: Int) -> Int {
    
    return no1 + no2
}


//calculator(n1: 2, n2: 3, operation: {(no1, no2) in no1 * no2})
let result = calculator(n1: 2, n2: 3, operation: {$0 * $1})

print(result) */

//calculator(n1:2, n2:3) {$0*$1}

let array = [6,2,3,9,4,1]




/*array.map({ (n1: Int) in n1 + 1
})*/
let newArray = array.map{"\($0 + 1)"}

print(newArray)


func Calculate (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int{
    
    return operation(n1, n2)
}


/*Calculate(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
} )*/

// Can Be converted into This Type
/*Calculate(n1: 2, n2: 3, operation: { (no1, no2) in
    return no1 * no2
 } )*/

// Can Be converted into This Type By Removing the -> Int and return
Calculate(n1: 2, n2: 3, operation: {(no1: Int, no2: Int) in no1 * no2} )

// By using Anonomyous parameter $
// Where $0 Refers to Parameter and $1 To Second Parameter
Calculate(n1: 2, n2: 3, operation: {$0 * $1})

//This Can be future converted into very shorts form
Calculate(n1: 2, n2: 3) {$0 * $1}



