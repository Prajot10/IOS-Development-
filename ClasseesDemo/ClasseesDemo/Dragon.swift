class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(Speech : String){
        print("Say \(Speech)")
    }
    
    override func move() {
        print("Fly Forwards")
    }
    
    override func attack() {
        super.attack()
        print("Split fire, does 10 damage.")
    }
}
