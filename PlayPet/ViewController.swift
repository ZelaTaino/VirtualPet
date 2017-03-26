//
//  ViewController.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/4/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

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
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var hungerLevel: UILabel!
    @IBOutlet weak var happinessView: DisplayView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var hungerView: DisplayView!
    @IBOutlet weak var petImage: UIButton!
    @IBOutlet weak var petSound: UILabel!
    @IBOutlet weak var cleanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pet = dog
        switchAnimalViews()
        petSound.isHidden = true
        cleanButton.isHidden = true
        imagePicker.delegate = self
        
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        pet.play()
        updateView()
    }
    
    @IBAction func feedPressed(_ sender: UIButton) {
        pet.feed()
        
        if pet.didPoop(){
            let x = arc4random_uniform(UInt32(background.bounds.width - 37))
            let y = arc4random_uniform(UInt32(background.bounds.height - 70))
            let aPoop = pet.poop(x: Int(x), y: Int(y))
            background.addSubview(aPoop)
            
            cleanButton.isHidden = false
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
        removePoops(poopList: pet.poops)
        pet = dog
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func catPressed(_ sender: UIButton) {
        removePoops(poopList: pet.poops)
        pet = cat
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func birdPressed(_ sender: UIButton) {
        removePoops(poopList: pet.poops)
        pet = bird
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func bunnyPressed(_ sender: UIButton) {
        removePoops(poopList: pet.poops)
        pet = bunny
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func fishPressed(_ sender: UIButton) {
        removePoops(poopList: pet.poops)
        pet = fish
        switchAnimalViews()
        updateView()
    }
    
    @IBAction func cleanPressed(_ sender: UIButton) {
        removePoops(poopList: pet.poops)
        pet.cleanPoop()
        cleanButton.isHidden = true
    }

    private func switchAnimalViews(){
        
        if pet.didPoop(){
            cleanButton.isHidden = false
        }else{
            cleanButton.isHidden = true
        }
        
        switch pet.animal{
        case .cat:
            let purple = UIColor(red: 142/255, green: 124/255, blue: 255/255, alpha: 1)
            happinessView.color = purple
            hungerView.color = purple
            background.backgroundColor = purple
            petImage.setImage(UIImage(named: "cat.png"), for: .normal)
            
            loadPoops(poopList: pet.poops)
            
        case .dog:
            let orange = UIColor(red: 255/255, green: 139/255, blue: 85/255, alpha: 1)
            happinessView.color = orange
            hungerView.color = orange
            background.backgroundColor = orange
            petImage.setImage(UIImage(named: "dog.png"), for: .normal)
            
            loadPoops(poopList: pet.poops)
            
        case .bird:
            let pink = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
            happinessView.color = pink
            hungerView.color = pink
            background.backgroundColor = pink
            petImage.setImage(UIImage(named: "bird.png"), for: .normal)
            
            loadPoops(poopList: pet.poops)
            
        case .bunny:
            let mint = UIColor(red: 111/255, green: 237/255, blue: 169/255, alpha: 1)
            happinessView.color = mint
            hungerView.color = mint
            background.backgroundColor = mint
            petImage.setImage(UIImage(named: "bunny.png"), for: .normal)
            
            loadPoops(poopList: pet.poops)
            
        case .fish:
            let blue = UIColor(red: 55/255, green: 80/255, blue: 255/255, alpha: 1)
            happinessView.color = blue
            hungerView.color = blue
            background.backgroundColor = blue
            petImage.setImage(UIImage(named: "fish.png"), for: .normal)
            
            loadPoops(poopList: pet.poops)
            
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
    
    func loadPoops(poopList: [Poop]){
        for poop in poopList{
            background.addSubview(poop)
        }
    }
    
    func removePoops(poopList: [Poop]){
        
        for (_, poop) in poopList.enumerated() {
            poop.removeFromSuperview()
        }
    }

    @IBAction func takePetPicture(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.cameraCaptureMode = .photo
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        petImage.setImage(image, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

