//
//  main.swift
//  Protocals and Delegates
//
//  Created by Prajot Awale on 25/11/23.
//

protocol AdvanceLifeSupport {
    func performCPR()
}


class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation() {
        print("Can you tell me that happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}


struct Paramedic : AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("Performing CPR and does chest compression")
    }
    
    
}

class Doctor: AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("Performing CPR and does chest compression for 30 sec.")
    }
    
    func useStethescope(){
        print("Listen Heart Sound")
    }
    
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sing staying alive by the beegees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
let prajot = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency( )
