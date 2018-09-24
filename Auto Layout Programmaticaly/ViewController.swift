//
//  ViewController.swift
//  Auto Layout Programmaticaly
//
//  Created by Arturs Vitins on 23/09/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dogImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "img1"))
        //enables auto lyout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    let headerText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "I am headder text", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\n I am body text -- I am body text -- I am body text -- I am body text -- I am body text -- I am body text", attributes: [
            NSAttributedStringKey.font           : UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor.gray
            ]))

        textView.attributedText = attributedText
        //old version
        //textView.text = "I am headder text"
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(headerText)
        
        setupLayout()
        
    }
    
    
    private func setupLayout () {
        
        let topImgContainerView = UIView()
        view.addSubview(topImgContainerView)
        topImgContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImgContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImgContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImgContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImgContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //topImgContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //topImgContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //img
        topImgContainerView.addSubview(dogImageView)
        dogImageView.centerXAnchor.constraint(equalTo: topImgContainerView.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: topImgContainerView.centerYAnchor).isActive = true
        dogImageView.heightAnchor.constraint(equalTo: topImgContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        //dogImageView.topAnchor.constraint(equalTo: topImgContainerView.topAnchor, constant: 100).isActive = true
        //dogImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //dogImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //header text
        headerText.topAnchor.constraint(equalTo: topImgContainerView.bottomAnchor, constant: 10).isActive = true
        headerText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        headerText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        headerText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
   


}


