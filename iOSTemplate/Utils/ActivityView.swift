//
//  ActivityView.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import UIKit
import MBProgressHUD

class ActivityView: NSObject {
    static func show(){
        self.hide()
        if let key = UIApplication.shared.windows.filter({$0.isKeyWindow}).first{
            let hud             = MBProgressHUD.showAdded(to: key, animated: true)
                   hud.bezelView.style = .solidColor
                   hud.bezelView.color = UIColor.clear
                   hud.bezelView.backgroundColor = UIColor.clear
            hud.contentColor    = .themeColor()
        }
    }
    static func hide(){
        if  let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
         MBProgressHUD.hide(for: window, animated: true)
        }
  
    }
    static func showToast(msg:String){
        if  let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            let hud             = MBProgressHUD.showAdded(to: window, animated: true)
                hud.mode = .text
                hud.label.text = msg
                hud.label.numberOfLines = 0
                hud.margin = 10.0
                let const = (UIScreen.main.bounds.height/2)
                //hud.offset.y -= const
                hud.removeFromSuperViewOnHide = true
                hud.hide(animated: true, afterDelay: 1.50)
        }
    }
    
     
}

