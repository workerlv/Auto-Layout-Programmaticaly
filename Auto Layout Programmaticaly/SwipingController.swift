//
//  SwipingController.swift
//  Auto Layout Programmaticaly
//
//  Created by Arturs Vitins on 14/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "img1", headerText: "I am header text 1", bodyText: "\n\n\n I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1"),
        Page(imageName: "img2", headerText: "I am header text 2", bodyText: "\n\n\n I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2"),
        Page(imageName: "img1", headerText: "I am header text 1", bodyText: "\n\n\n I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1"),
        Page(imageName: "img2", headerText: "I am header text 2", bodyText: "\n\n\n I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2"),
        Page(imageName: "img1", headerText: "I am header text 1", bodyText: "\n\n\n I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1 -- I am body text 1"),
        Page(imageName: "img2", headerText: "I am header text 2", bodyText: "\n\n\n I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2 -- I am body text 2")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    
    }
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    fileprivate func setupBottomControls () {
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        //other method to activate constraints (instead of "isActive")
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        pageControl.currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
    }
    
}
