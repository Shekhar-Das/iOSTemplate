//
//  CollectionView.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 22/4/23.
//

import UIKit
class CustomCollectionView : CustomAutoSlider {
    
    var items = [Any]()
    var numberOfColumn : CGFloat = 0
    var minimumIteritemSpacing : CGFloat = 0.0
    var minimumLineSpacing : CGFloat = 0.0
    var flowLayout : UICollectionViewFlowLayout?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }
    
    func setUpView() {
        self.setUpCollectionViewLayoutForDisplay()
        self.registerXibForDisplay()
    }
    
    func setUpCollectionViewLayoutForDisplay() {
        self.flowLayout = UICollectionViewFlowLayout.init()
        self.collectionViewLayout = self.flowLayout!
    }
    
    func registerXibForDisplay() {
        
    }
    
    func resetInformation() {
        if self.items.count > 0  {
            self.items.removeAll()
            self.reloadData()
            self.collectionViewLayout.invalidateLayout()
        }
    }
    
    
    func addItems(items: [Any]?) {
        self.resetInformation()
        if let selectedItems = items, selectedItems.count > 0 {
            self.items.append(contentsOf: selectedItems)
        }
    }
    
    
}
