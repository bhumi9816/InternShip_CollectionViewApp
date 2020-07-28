//
//  ProfileHeader.swift
//  CollectionViewApp
//
//  Created by Bhumi Patel on 7/8/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - PropertiesofProfile_view
    
    let profileView: UIImageView = {
        
        //inside the declaration of the image and configuring all the attributes
        
        var imageView = UIImageView()
        //identifer for our image
        let image1 = UIImage(named: "fIcon1")
        //set the image to the ImageView
        imageView = UIImageView(image: image1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
        
    }()  //create a constructor
    
    lazy var message_button: UIButton = {
        let mButton = UIButton(type: .system)
        let mImage = UIImage(named: "mIcon")
        mButton.setImage(mImage!.withRenderingMode(.alwaysOriginal), for: .normal)
        mButton.addTarget(self, action: #selector(messageHandle), for: .touchUpInside)
        
        return mButton
        
    }()
    
    lazy var follow_button: UIButton = {
        let fButton = UIButton(type: .system)
        let fImage = UIImage(named: "follow_icon2")
        fButton.setImage(fImage!.withRenderingMode(.alwaysOriginal), for: .normal)
        fButton.addTarget(self, action: #selector(followHandle), for: .touchUpInside)
        
        return fButton
        
    }()
    
    let name_label: UILabel = {
        let label1 = UILabel()
        label1.textAlignment = .center
        label1.text = "Kaite Wilson"
        label1.font = UIFont.boldSystemFont(ofSize: 25)
        label1.textColor = .white
        return label1
        
        
    }()
    
    let email_label: UILabel = {
        let label2 = UILabel()
        label2.textAlignment = .center
        label2.text = "kaitewilson99@hotmail.com"
        label2.font = UIFont.boldSystemFont(ofSize: 17)
        label2.textColor = .white
        return label2
        
        
    }()
    
    //MARK: - INIT methods
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .mainColor
        
        addSubview(profileView)
        profileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileView.anchor(top: topAnchor, paddingTop: 100, width: 100, height: 100)
        
        //in-order to round we need cornerRadius for our image
        profileView.layer.cornerRadius = 100/2
        
        addSubview(message_button)
        message_button.anchor(top: topAnchor, left: leftAnchor, paddingTop: 65, paddingLeft: 32, width: 35, height: 35)
        
        addSubview(follow_button)
        follow_button.anchor(top: topAnchor, right: rightAnchor, paddingTop: 65, paddingRight: 35, width: 35, height: 35)
        
        addSubview(name_label)
        name_label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        name_label.anchor(top: profileView.bottomAnchor, paddingTop: 12)
        
        addSubview(email_label)
        email_label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        email_label.anchor(top: name_label.bottomAnchor, paddingTop: 4)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func messageHandle() {
        print("Message user here... ")
    }
    
    @objc func followHandle() {
        print("Follow user here... ")
    }
    
    
}
