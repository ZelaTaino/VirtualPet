//
//  Pet.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/4/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import Foundation

class Pet{

    
    enum Animal {
        case cat
        case dog
        case bird
        case bunny
        case fish
    }
    
    //Data
    private (set) var happinessLevel: Int
    private (set) var fedLevel: Int
    private (set) var sound: String
    var animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
        happinessLevel = 50
        fedLevel = 50
        sound = ""
    }
    
    func play(){
        happinessLevel += 5
        if(happinessLevel > 100){
            happinessLevel = 100
        }
        fedLevel -= 5
        if fedLevel < 0 {
            fedLevel = 0
        }
    }
    
    func feed(){
        fedLevel += 5
        if(fedLevel > 100){
            fedLevel = 100
        }
        happinessLevel -= 5
        if happinessLevel < 0 {
            happinessLevel = 0
        }
    }
    
    func didPoop() -> Bool{
        if fedLevel >= 100{
            return true
        }
        return false
    }
    
    func poop(){
        happinessLevel = 100
        fedLevel = 50
    }
    
    func speak() -> String{
        switch animal {
        case .dog:
            sound = "Bark!"
        case .cat:
            sound = "Meow!"
        case .bunny:
            sound = "Squeak!"
        case .fish:
            sound = "Bloop!"
        case .bird:
            sound = "Chirp!"
        }
        
        return sound
    }

}
