//
//  AppSession.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import UIKit
import GoogleSignIn
//import FBSDKLoginKit
class AppSession: NSObject {
    static let share: AppSession = {
        let instance = AppSession()
        return instance
    }()

    var registrationType = (id:0,type:"Apple")
  
    
    open var navigationController: UINavigationController? = nil
    
    var isFirstLoad      = false
    var isFirstLoadSelect = false
    var isfirsLoadSelectedExam = false
    var isShowCreateEvent = false
    var isShowHome = false
    var remarks       = ""
    
    var categoryId = ""
    var educationId = ""
    
    var isActionTaken = false
    var isFormNotification  = false
    var pushModel           = KANotificationModel()
    
    var isForHomeRedirection = false
    
    
    var weeklyButtonArray = [UIButton]()
    
    static var authToken: String? {
        get {
            return UserDefaults.standard.string(forKey: UDConst.UserAuthToken)
        }
        set {
            let s: UserDefaults = UserDefaults.standard
            if newValue != nil {
                s.set(newValue, forKey: UDConst.UserAuthToken)
            } else {
                s.removeObject(forKey: UDConst.UserAuthToken)
            }
            s.synchronize()
        }
    }
    
    
    
    //===========================================================
    //MARK: - WebServcie Methods
    //===========================================================
    func logOutServiceCall(vc:UIViewController){}
    
    func logoutFB(){
        /*
        if  let current = AccessToken.current?.tokenString {
            let token = String(describing:current)
            
            AccessToken.current?.hasGranted(permission:"email")
            
            
            GraphRequest(graphPath: "me/permissions/email", parameters: [:], tokenString:token , version: "", httpMethod: .delete).start( completion: { (connection, result, error) in
                
                
                if let dict = result as? [String:Any]{
                    print(dict)
                }
                
                LoginManager().logOut()
            })
        }
        
        */
    }
    
}


extension AppSession {
    func logOut(){
       /* AppSession.share.ageGroupList.removeAll()
        AppSession.share.filterAgeGroupList.removeAll()
        AppSession.share.settingsList.removeAll()
        AppSession.share.interestList.removeAll()
        AppSession.share.filterCategory.removeAll()
        AppSession.share.filterInterstList.removeAll()
        AppSession.share.groupList.removeAll()
        AppSession.share.myGroupList.removeAll()
        AppSession.share.exploreGroupList.removeAll()
        */
       // let scence = AppDelegate.shared.currentScene
       // SceneDelegate.share.setLoginScreen(scence!)
        UserDefaults.standard.removeObject(forKey: UDConst.UserAuthToken)
       // UserModel.clear()
    }
}

