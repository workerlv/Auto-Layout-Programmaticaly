//
//  PageCell.swift
//  Auto Layout Programmaticaly
//
//  Created by Arturs Vitins on 14/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {

            guard let unwrappedPage = page else { return }
            
            dogImageView.image = UIImage(named: unwrappedPage.imageName)
            
                let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
                attributedText.append(NSAttributedString(string: unwrappedPage.bodyText, attributes: [
                    NSAttributedStringKey.font           : UIFont.systemFont(ofSize: 14),
                    NSAttributedStringKey.foregroundColor : UIColor.gray
                    ]))
            
            headerText.attributedText = attributedText
            headerText.textAlignment = .center
            
        }
    }
    
    private let dogImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "img1"))
        //enables auto lyout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        //imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let headerText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "I am headder text", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\n I am body text -- I am body text -- I am body text -- I am body text -- I am body text -- I am body text", attributes: [
            NSAttributedStringKey.font           : UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor.gray
            ]))
        
        textView.attributedText = attributedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    
    private func setupLayout () {
        
        let topImgContainerView = UIView()
        addSubview(topImgContainerView)
        topImgContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImgContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImgContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImgContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImgContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        //img
        topImgContainerView.addSubview(dogImageView)
        dogImageView.centerXAnchor.constraint(equalTo: topImgContainerView.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: topImgContainerView.centerYAnchor).isActive = true
        dogImageView.heightAnchor.constraint(equalTo: topImgContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
       
        addSubview(headerText)
        //header text
        headerText.topAnchor.constraint(equalTo: topImgContainerView.bottomAnchor, constant: 10).isActive = true
        headerText.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        headerText.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        headerText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
