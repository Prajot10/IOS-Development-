struct Town{
    let name : String
    var citizens : [String]
    var resources : [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]){
        self.name = name
        self.citizens = citizens
        self.resources = resources
        
    }
    
    
    func fortify() {
        print("Defences increased!")
    }
}


var anotherTown = Town(name: "Pune", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])

anotherTown.citizens.append("Pratik")

print(anotherTown.citizens)

var ghostTown = Town(name: "Ghosty", citizens: [], resources: ["Wheat": 20])

anotherTown.citizens.append("Preu")
ghostTown.fortify()













