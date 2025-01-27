protocol Canfly {
    func fly()
}

class bird {
    
    var isFemale = true
    
    func layEggs(){
        if isFemale{
            print("The bird make a new bird in shell. ")
        }
    }
}


class Eagle: bird, Canfly {
    func fly() {
        print("Eagle flaps its wings and lift off into the sky. ")
    }
    
    
    func soar(){
        print("The eagle glides in the air currents. ")
    }
}

class Penguin: bird{
    func swim(){
        print("The penguin paddies through the water. ")
    }
}

struct FlyingMuseam {
    func flyingDemo(flyingObject: Canfly){
        flyingObject.fly()
    }
}

struct airplane: Canfly{
    func fly() {
        print("Use engine to lift in air")
    }
}


let myEagle = Eagle()
myEagle.fly()


let mypenguin = Penguin()

let myplane = airplane()

let measum = FlyingMuseam()
measum.flyingDemo(flyingObject: myplane)
