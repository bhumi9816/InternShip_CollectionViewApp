//
//  Profile_Cell.swift
//  CollectionViewApp
//
//  Created by Bhumi Patel on 7/9/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit

class Profile_cell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var image: UIImage? {
        didSet {
            
            //safe unwrapping of when the image is being set
            guard let image = image else {return}
            cellImageView.image = image
        }
    }
    
    let cellImageView: UIImageView = {
        
        //inside the declaration of the image and configuring all the attributes
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "flower10")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
        
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        //add it to the cells
        addSubview(cellImageView)
        cellImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
