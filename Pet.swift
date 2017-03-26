//
//  Pet.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/4/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import Foundation
import UIKit

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
    private (set) var image: UIImage
    var poops = [Poop]()
    var animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
        happinessLevel = 50
        fedLevel = 50
        sound = ""
        
        switch animal {
        case .dog:
            image = UIImage(named: "dog.png")!
        case .cat:
            image = UIImage(named: "cat.png")!
        case .bunny:
            image = UIImage(named: "bunny.png")!
        case .fish:
            image = UIImage(named: "fish.png")!
        case .bird:
            image = UIImage(named: "bird.png")!
        }


        
    }
    
    func setImage(petImage: UIImage) {
        image = petImage
    }
    
    func getImage() -> UIImage {
        return image
    }
    
    func play(){
        happinessLevel += 10
        if(happinessLevel > 100){
            happinessLevel = 100
        }
        fedLevel -= 10
        if fedLevel < 0 {
            fedLevel = 0
        }
    }
    
    func feed(){
        fedLevel += 10
        if(fedLevel > 100){
            fedLevel = 100
        }
        happinessLevel -= 10
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
    
    func poop(x:Int,y:Int) -> Poop{
        let frame = CGRect(x: x,y: y,width: 37,height: 37)
        let aPoop = Poop(frame: frame)
        poops.append(aPoop)
        
        return aPoop
    }
    
    func cleanPoop(){
        poops.removeAll()
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
