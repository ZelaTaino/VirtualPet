//
//  ViewController.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/4/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var happinessLevel: UILabel!
    
    var pet: Pet! {
        didSet{
            updateView()
        }
    }
    let dog = Pet(animal: .dog)
    let cat = Pet(animal: .cat)
    let bird = Pet(animal: .bird)
    let bunny = Pet(animal: .bunny)
    let fish = Pet(animal: .fish)
    @IBOutlet weak var hungerLevel: UILabel!
    @IBOutlet weak var happinessView: DisplayView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var hungerView: DisplayView!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petSound: UILabel!
    @IBOutlet weak var poopImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pet = dog
        switchAnimalViews()
        petSound.isHidden = true
        poopImage.isHidden = true
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        pet.play()
        poopImage.isHidden = !pet.didPoop() //did poop so hidden false
        updateView()
    }
    
    @IBAction func feedPressed(_ sender: UIButton) {
        pet.feed()
        
        
//        if pet.didPoop(){
//            let x = arc4random_uniform(UInt32(self.view.frame.width))
//            let y = arc4random_uniform(UInt32(self.view.frame.height))
//            
//            Poop(x: Int(x), y: Int(y))
//        }
        
        poopImage.isHidden = !pet.didPoop() //did poop so hidden false
        if pet.didPoop(){
            let when = DispatchTime.now() + 0.7
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.pet.poop()
                self.updateView()
            }
        }
        updateView()
    }
    
    @IBAction func speakPressesDown(_ sender: UIButton) {
        petSound.text = pet.speak()
        petSound.isHidden = false
    }
    
    @IBAction func speakPressedUp(_ sender: Any) {
        petSound.isHidden = true
    }
    
    @IBAction func dogPressed(_ sender: UIButton) {
        pet = dog
        poopImage.isHidden = !pet.didPoop()
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func catPressed(_ sender: UIButton) {
        pet = cat
        poopImage.isHidden = !pet.didPoop()
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func birdPressed(_ sender: UIButton) {
        pet = bird
        poopImage.isHidden = !pet.didPoop()
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func bunnyPressed(_ sender: UIButton) {
        pet = bunny
        poopImage.isHidden = !pet.didPoop()
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func fishPressed(_ sender: UIButton) {
        pet = fish
        poopImage.isHidden = !pet.didPoop()
        switchAnimalViews()
        updateView()
    }
    
    private func switchAnimalViews(){
        switch pet.animal{
        case .cat:
            let purple = UIColor(red: 142/255, green: 124/255, blue: 255/255, alpha: 1)
            happinessView.color = purple
            hungerView.color = purple
            background.backgroundColor = purple
            petImage.image = UIImage(named: "cat.png")
        case .dog:
            let orange = UIColor(red: 255/255, green: 139/255, blue: 85/255, alpha: 1)
            happinessView.color = orange
            hungerView.color = orange
            background.backgroundColor = orange
            petImage.image = UIImage(named: "dog.png")
        case .bird:
            let pink = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
            happinessView.color = pink
            hungerView.color = pink
            background.backgroundColor = pink
            petImage.image = UIImage(named: "bird.png")
        case .bunny:
            let mint = UIColor(red: 111/255, green: 237/255, blue: 169/255, alpha: 1)
            happinessView.color = mint
            hungerView.color = mint
            background.backgroundColor = mint
            petImage.image = UIImage(named: "bunny.png")
        case .fish:
            let blue = UIColor(red: 55/255, green: 80/255, blue: 255/255, alpha: 1)
            happinessView.color = blue
            hungerView.color = blue
            background.backgroundColor = blue
            petImage.image = UIImage(named: "fish.png")
        }
    }
    
    private func updateView(){
        happinessLevel.text = String(pet.happinessLevel)
        hungerLevel.text = String(pet.fedLevel)
        
        let happinessVal = Double(pet.happinessLevel)/100
        let hungerVal = Double(pet.fedLevel)/100
        happinessView.animateValue(to: CGFloat(happinessVal))
        hungerView.animateValue(to: CGFloat(hungerVal))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

