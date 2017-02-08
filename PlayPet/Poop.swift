//
//  Poop.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/8/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class Poop: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let img = UIImage(named: "poop.png")
        self.image = img
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
