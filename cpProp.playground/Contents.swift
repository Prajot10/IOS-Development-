import Foundation

var pizzaInInches: Int = 10 {
    willSet{
        print(pizzaInInches)
        print(newValue)
    }
    didSet{
        if pizzaInInches >= 18 {
            print("Invalid Size Specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 8 
print(pizzaInInches)



var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    
}

var numberOfPizza : Int {
    get{
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set{
        let totalSlices = numberOfPeople * numberOfSlices
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 7

print(numberOfPeople)


