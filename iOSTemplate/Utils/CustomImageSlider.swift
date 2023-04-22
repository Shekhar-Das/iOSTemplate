//
//  CustomImageSlider.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 22/4/23.
//

import UIKit

class CustomImageSlider: CustomCollectionView {
    
    var images : [String]?
    var currentDisplayIndexHandler: ((Int) -> Void)?
    
    override func setUpView() {
        super.setUpView()
        self.numberOfColumn = 1
        self.minimumIteritemSpacing = 0.0
        self.minimumLineSpacing = 0.0
        self.dataSource  = self
        self.delegate = self
    }
    
    override func registerXibForDisplay() {
        self.register(UINib(nibName: "Nib name", bundle: Bundle.main), forCellWithReuseIdentifier: "nib Name")
    }
    
    override func setUpCollectionViewLayoutForDisplay() {
        super.setUpCollectionViewLayoutForDisplay()
        self.flowLayout?.itemSize = CGSize.init(width: self.frame.width, height: self.frame.height)
        self.flowLayout?.scrollDirection = UICollectionView.ScrollDirection.horizontal
    }
    
    
}

extension CustomImageSlider : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.bounds.width, height: self.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.minimumIteritemSpacing
    }
    
}

extension CustomImageSlider : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell name", for: indexPath as IndexPath)  //as "cellName"
        
        cell.layoutIfNeeded()
        cell.setNeedsDisplay()
        
        if let images = images  {
            // send image from nib to view controller function
        }
        
        return cell
    }
}
extension CustomImageSlider : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / self.frame.width
        self.currentDisplayIndexHandler?(Int(scrollPosition))
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.stopScrolling()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.startScrolling()
    }
}
