//
//  Poop.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/7/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import Foundation
import UIKit

class Poop{

    init(x: Int, y: Int){
        let frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: 37, height: 37)
        let poopImg = UIImage(named: "poop.png")
        let poop = UIImageView(frame: frame)
        poop.image = poopImg
        //poop.addSubview(<#T##view: UIView##UIView#>)
    }

}
