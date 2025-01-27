let myOptional : String?

myOptional = nil


// 2] Check Nil Value
/*if myOptional != nil{
    let text : String = myOptional!
}else{
    print("My optional was found to be nil")
}*/

// 3] Optional Binding
/*if let safeOptional = myOptional{
    let text : String = safeOptional
    print(safeOptional)
}else{
    print("My optional was found to be nil")
    
}*/

// 4] Nil Coalescing Operator

/*let text: String = myOptional ?? "I am the Default value"

print(text)*/

struct myoptional{
    var property = 123
    func method(){
        print("I am the struct method")
    }
}

let myoptional1 : myoptional?

myoptional1 = myoptional()

print(myoptional1?.property)


myoptional1?.method()
