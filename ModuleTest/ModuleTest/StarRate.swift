//
//  StarButton.swift
//  ModuleTest
//
//  Created by apple on 18/01/17.
//  Copyright © 2017 Sarath Raveendran. All rights reserved.
//

import Foundation

import UIKit

class StarRate: UIButton {
    
    // Images
    let checkedImage = UIImage(named: "star_filled")! as UIImage
    let uncheckedImage = UIImage(named: "star")! as UIImage
    
    // Bool property
    var isRated: Bool = false {
        didSet{
            if isRated == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isRated = false
        self.imageView?.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = false
    }
    
}
