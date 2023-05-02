//
//  StaticHelper.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import Foundation
import UIKit

class StaticHelper: NSObject {
    //===========================================================
    //MARK: - AppDelegate Reference
    //===========================================================
    static let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //===========================================================
    //MARK: - Check whether User is Login or not
    //===========================================================
    static var isLogin:Bool{
//        if let _ = UserDefaults.standard.object(forKey: UDConst.UserModel) {
//            return true
//        }
        return false
    }
    //===========================================================
    //MARK: - Check Internet Connectivity
    //===========================================================
    static var isInternetConnected:Bool{
        let reachability =  Reachability()!
        return reachability.isReachable
    }
    //MARK: - DeviceToken For RemoteNotification
    //===========================================================
    static var deviceId:String{
        if let deviceToken = UserDefaults.standard.object(forKey: UDConst.DeviceToken) {
            return deviceToken as! String
        }
        return "#iOS"
    }
    //===========================================================
    //MARK: - BundleIdentifier
    //===========================================================
    static var bundleId:String{
        return Bundle.main.bundleIdentifier!
    }
    //===========================================================
    //MARK: - BuildNumber
    //===========================================================
    static var buidNumber:String {
        var numberString = ""
        if let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            numberString += versionNumber
        }
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            numberString += "." + buildNumber
        }
        return numberString
    }
    //===========================================================
    //MARK: - Logout Methods
    //===========================================================
    static func logOutUser() {
        UserDefaults.standard.removeObject(forKey: UDConst.User)
        UserDefaults.standard.synchronize()
       // appDelegate.setRootViewController(vc: .Login)
    }
    //===========================================================
    //MARK: - OpenUrl Methods
    //===========================================================
    static func openUrl(url urlString:String){
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) == true{
            UIApplication.shared.open(url, options: [:], completionHandler: { (flag) in
            })
        }
    }
    static func call(toNumber number:String){
        let urlString = "telprompt://" + number
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) == true{
            UIApplication.shared.open(url, options: [:], completionHandler: { (flag) in
            })
        }
    }
}
