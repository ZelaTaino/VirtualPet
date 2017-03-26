//
//  Pet.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/4/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

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
    var sound: SystemSoundID!
    var audioPlayer = AVAudioPlayer()
    private (set) var image: UIImage
    var poops = [Poop]()
    var animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
        happinessLevel = 50
        fedLevel = 50
        
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
        
        sound = createSound()
    }
    
    func createSound() -> SystemSoundID {
        var soundID: SystemSoundID = 0
        
        switch animal {
        case .dog:
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "dog" as CFString!, "mp3" as CFString!, nil)
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        case .cat:
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "cat" as CFString!, "mp3" as CFString!, nil)
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        case .bunny:
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "bunny" as CFString!, "mp3" as CFString!, nil)
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        case .fish:
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "fish" as CFString!, "mp3" as CFString!, nil)
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        case .bird:
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "bird" as CFString!, "mp3" as CFString!, nil)
            AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        }
        
        return soundID
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
    
    func speak(){
        AudioServicesPlaySystemSound(sound)
    }

}
