//
//  Storyboarded.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 20/4/23.
//

import Foundation
import UIKit
// MARK: ---------- PROTOCOL : Storyboarded ----------
protocol Storyboarded {
   static func instantiate() -> Self
}

// MARK: ---------- EXTENSION : Storyboarded ----------
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboardName = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboardName.instantiateViewController(withIdentifier: className) as! Self
        return viewController
    }
}

extension UIViewController: Storyboarded {
  static func getVC(_ style:UIModalPresentationStyle? = nil)-> UIViewController {
      let vc = self.instantiate()
    if let presentationStyle = style {
    vc.modalPresentationStyle = presentationStyle
    }
    return vc
  }
}
