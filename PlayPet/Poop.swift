//
//  Poop.swift
//  PlayPet
//
//  Created by Glizela Taino on 2/8/17.
//  Copyright © 2017 Glizela Taino. All rights reserved.
//

import UIKit

class Poop: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let img = UIImageView(image: UIImage(named: "poop.png"))
        let imgFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        img.frame = imgFrame
        self.addSubview(img)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
