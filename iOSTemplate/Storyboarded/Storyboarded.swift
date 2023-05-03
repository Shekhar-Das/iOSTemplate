//
//  Storyboarded.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 20/4/23.
//

import Foundation
import UIKit


fileprivate enum Storyboards: String {
    case auth = "Authentication"
    case main = "Main"
}

// MARK: ---------- PROTOCOL : Storyboarded ----------
protocol Storyboarded {
   static func instantiate() -> Self
}


fileprivate extension UIStoryboard {
    
    static func loadFromAuthStoryboard(_ indentifier: String) -> UIViewController {
        let loginStoryboard = UIStoryboard(name: Storyboards.auth.rawValue, bundle: nil)
        let loginController = loginStoryboard.instantiateViewController(identifier: indentifier)
        return loginController
    }
    
    static func loadFromMainStoryboard(_ indentifier: String) -> UIViewController {
        let mainStoryboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil)
        let mainController = mainStoryboard.instantiateViewController(identifier: indentifier)
        return mainController
    }
}


extension UIStoryboard {
    static func loadWelcomeScreenVC() -> WelcomeVC {
        return loadFromAuthStoryboard("WelcomeVC") as! WelcomeVC
        
    }
    
    static func loadLoginVC() -> LoginVC {
        return loadFromAuthStoryboard("LoginVC") as! LoginVC
        
    }
    
    static func loadWelcomeScreenVC() -> RegistrationVC {
        return loadFromAuthStoryboard("RegistrationVC") as! RegistrationVC
        
    }
}

//// MARK: ---------- EXTENSION : Storyboarded ----------
//extension Storyboarded where Self: UIViewController {
//    static func instantiate() -> Self {
//        let fullName = NSStringFromClass(self)
//        let className = fullName.components(separatedBy: ".")[1]
//        let storyboardName = UIStoryboard(name: Storyboards.main.rawValue, bundle: Bundle.main)
//        let viewController = storyboardName.instantiateViewController(withIdentifier: className) as! Self
//        return viewController
//    }
//}
//
//extension UIViewController: Storyboarded {
//  static func getVC(_ style:UIModalPresentationStyle? = nil)-> UIViewController {
//      let vc = self.instantiate()
//    if let presentationStyle = style {
//    vc.modalPresentationStyle = presentationStyle
//    }
//    return vc
//  }
//}
