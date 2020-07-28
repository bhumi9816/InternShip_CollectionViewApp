//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Bhumi Patel on 7/4/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit

//create a header resuableIdentifer
private let header_identifier = "ProfileHeader"

//create a profile cell resuableIdentifier
private let cell_identifier = "Profile_cell"




class ViewController: UICollectionViewController {
    
    //creating an array of images and populate our collection view and here it will static
    
    var images: [UIImage] = [#imageLiteral(resourceName: "flower2"), #imageLiteral(resourceName: "flower7"), #imageLiteral(resourceName: "flower11"), #imageLiteral(resourceName: "flower3"), #imageLiteral(resourceName: "flower5"), #imageLiteral(resourceName: "flower4"), #imageLiteral(resourceName: "flower10"), #imageLiteral(resourceName: "flower9"), #imageLiteral(resourceName: "flower8"), #imageLiteral(resourceName: "flower6"), #imageLiteral(resourceName: "flower12"), #imageLiteral(resourceName: "flower1")]
    
    
    
    //MARK: - Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
       
        
        //register our header, dequeuing, if a cell not on screen it dequeues those cell from the memory when not on screen
        collectionView!.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header_identifier)
        
         //register collectionView cell
        collectionView.register(Profile_cell.self, forCellWithReuseIdentifier: cell_identifier)
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    


}

//MARK: - Extensions

//implement a function to show our Header named viewforSupplement

//extension for UICollectionView Delegate/Data Source
extension ViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header_identifier, for: indexPath) as! ProfileHeader
        
        return header 
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count //return 12 cells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_identifier, for: indexPath) as! Profile_cell
        
        //every time we want to set an image didSet is being called and cellForItemAt is called 12 times. Starts at the indexpath zero, and look at the imageArray and goes to the first cell [image mapping]
        cell.image = images[indexPath.row]
        
        return cell
    }
}





//have access to some methods under UICollectionView framework
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1   //line spacing between successive items and it is only one pixel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1   //spacing between spacing of each section
    }
    
    
    //setting up the size for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
}



//get custom colors
extension UIColor {
    
    static func custom_color(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainColor = UIColor.custom_color(red: 0, green: 150, blue: 255)
    
}

extension UIView {
    
    //anchor function for autolayout and setting up constraints. Input parameters to pin our view
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        
        //negstive coordinate system
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
                
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
