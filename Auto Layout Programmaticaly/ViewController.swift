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
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(headerText)
        
        setupBottomControls()
        
        setupLayout()
        
    }
    
    fileprivate func setupBottomControls () {
    
       // view.addSubview(previousButton)
     //   previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)

        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)

        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        //other method to activate constraints (instead of "isActive")
//        NSLayoutConstraint.activate([
//            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            previousButton.heightAnchor.constraint(equalToConstant: 50)
//            ])
        
    
    
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


