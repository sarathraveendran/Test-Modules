//
//  VideoCell.swift
//  youtube
//
//  Created by Brian Voong on 6/3/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit


class FeedsViewCell: UICollectionViewCell {
    
    // MARK: Connection Objects
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var propertyImageView: ImageView!
    @IBOutlet weak var propertyAddressLabel: UILabel!
    @IBOutlet weak var propertyLocationLabel: UILabel!
    @IBOutlet weak var propertySaleStatusLabel: UILabel!
    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var propertyDeveloeprLabel: UILabel!
    @IBOutlet weak var propertyFavoursButton: UIButton!
    @IBOutlet weak var propertyCommentsButton: UIButton!
    @IBOutlet weak var cuttingEdgeView: TriangleView!
    @IBOutlet weak var starButton: StarRate!
    
    
    // Declarations
    let color = Colors.sharedInstance
    let buttonInset: CGFloat = 6
    
    var feed: Feeds? {
        
        didSet {
            propertyImageView.loadImageFromUrl(feed?.imageUrl ?? "")
            propertyAddressLabel.text = feed?.address ?? nil
            propertyLocationLabel.setImageAndText(titleText: feed?.distirctName ?? "location", imageName: "placeholder")
            propertySaleStatusLabel.setImageAndText(titleText: feed?.saleDate ?? "location", imageName: "calendar")
            
            if let developerNames = feed?.developerName, developerNames.count > 0 {
                // Reads only first one
                if let developerName = developerNames[0].name {
                    propertyDeveloeprLabel.text = "Developer: \(developerName)"
                }
            }
            
            propertyFavoursButton.setTitle("\(feed?.favorCount ?? "0")", for: .normal)
            propertyCommentsButton.setTitle("\(feed?.commentCount ?? "0")", for: .normal)
            
            if let isRated = feed?.isStar {
                starButton.isRated = (isRated == "true") ? true : false
            }
        }
        
    }
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    
    // Arrange view
    func configureView() {
        
        propertySaleStatusLabel.textColor = color.feedPageSaleText
        propertyFavoursButton.imageView?.contentMode = .scaleAspectFit
        propertyCommentsButton.imageView?.contentMode = .scaleAspectFit
        propertyFavoursButton.imageEdgeInsets = UIEdgeInsets(top: buttonInset, left: buttonInset, bottom: buttonInset, right: buttonInset)
        propertyCommentsButton.imageEdgeInsets = UIEdgeInsets(top: buttonInset, left: buttonInset, bottom: buttonInset, right: buttonInset)
    
    }
 
    
}


// Empty cell
class EmptyCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: ImageView!
    
}


