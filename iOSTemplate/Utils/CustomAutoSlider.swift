//
//  CustomAutoSlider.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 22/4/23.
//

import UIKit

enum ScrollDirection: String {
    case left = "left"
    case right = "right"
}

class CustomAutoSlider: UICollectionView {
    private var timer = Timer()
    var scrollInterval: Int = 5
    private var isEnableAutoScroll: Bool = false
    

    func enableAutoScrolling(isEnable: Bool){
        self.isEnableAutoScroll = isEnable
    }
}

extension CustomAutoSlider {
    fileprivate func setTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(scrollInterval), target: self, selector: #selector(self.autoScrollImageSlider), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer, forMode: RunLoop.Mode.common)
    }
    
    
    //start scrolling
    func startScrolling() {
        if self.isEnableAutoScroll == false {
            return
        }
        
        if !timer.isValid {
            if (self.numberOfItems(inSection: 0) != 0) {
                stopScrolling()
                setTimer()
            }
        }
    }
    
    //stop scrolling
    func stopScrolling() {
        
        if self.isEnableAutoScroll == false {
            return
        }
        
        if timer.isValid {
            self.timer.invalidate()
        }
    }
    
// auto scrolling
    
    @objc fileprivate func autoScrollImageSlider() {
        
        DispatchQueue.main.async {
            let firstIndex = 0
            let lastIndex = self.numberOfItems(inSection: 0) - 1
            let visiableCellsIndexes = self.indexPathsForVisibleItems.sorted()
            
            if !visiableCellsIndexes.isEmpty {
                let nextIndex = visiableCellsIndexes[0].row + 1
                let nextIndexPath: IndexPath = IndexPath.init(item: nextIndex, section: 0)
                let firstIndexPath : IndexPath = IndexPath.init(item: firstIndex, section: 0)
                (nextIndex > lastIndex ) ?  (self.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: true)) :  (self.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true))
            }
        }
    }
    
    //scroll to privious or next item
    
    func scrollToPrivousOrNextCell(direction: ScrollDirection) {
        let firstIndex = 0
        let lastIndex = self.numberOfItems(inSection: 0) - 1
        let visibleCellsIndexes = self.indexPathsForVisibleItems.sorted()
        
        if !visibleCellsIndexes.isEmpty {
            let nextIndex = visibleCellsIndexes[0].row + 1
            let priviousIndex = visibleCellsIndexes[0].row - 1
            let nextIndexPath: IndexPath = IndexPath.init(item: nextIndex, section: 0)
            let priviousIndexPath : IndexPath = IndexPath.init(item: firstIndex, section: 0)
            
            
//            switch direction {
//            case .left:
//                (priviousIndex < firstIndex) ? self.doNothing() : self.scrollToItem(at: priviousIndexPath, at: .centeredHorizontally, animated: true)
//                break
//            case .right:
//                (nextIndex > lastIndex) ? self.doNothing() : self.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
//
//            }
        }
    }
    
    
    //do nothing
    
    private func doNothing(){
        
    }
}

extension CustomAutoSlider {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.isEnableAutoScroll == true {
            self.stopScrolling()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if self.isEnableAutoScroll == true {
            self.startScrolling()
        }
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        if self.isEnableAutoScroll == true {
            self.startScrolling()
        }
    }
    
    
}
