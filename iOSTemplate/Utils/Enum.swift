//
//  Enum.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import Foundation
import UIKit

//===========================================================
//MARK: - RootViewController
//===========================================================
enum RootViewController {
    case Home,Login, AdminHome, AdminLogin, UnicaCRMLogin, UnicaCRMHome
}
enum UserloginType {
    case Admin,Student
}

enum UCRMFilterType:String {
    case Branch     = "Branch"
    case Counsellor = "Counsellor"
    case Country    = "Country"
    case intake     = "Intake Month"
    case intakeYear = "Intake Year"
}
enum TMSUserType:String {
    case SuperAdmin       = "S"
    case BranchMentor     = "MR"
    case BranchHOO        = "H"
    case BranchOffice     = "B"
    case Counsellor       = "C"
    case ProcessingOffice = "P"
    case FrontOffice      = "F"
    case Marketing        = "MK"
}



enum TMSfilterType:String {
    case Branch   = "branch"
    case UserType = "userType"
    case User     = "User"
    case None     = "None"
    case remarksStatus = "Status"
}


/*
 -------------------------------------------
 S Super Admin
 MR Branch Mentor
 H Branch HOO

 -------------------------------------------
 B Branch Office
 --------------------------------------------
 C Counsellor
 P Processing Office
 F Front Office
 MK Marketing
 
 */

enum searchNotification:String {
    case  allRequestSearch     = "SearchAll"
    case  sendRequestSearch    = "sendSearch"
    case recievedRequestSearch = "recieveSearch"
    case confirmRequestSearch  = "confirmSearch"
}

enum instSearchNotification:String {
    case  allRequestSearch     = "SearchAll"
    case  sendRequestSearch    = "sendSearch"
    case recievedRequestSearch = "recieveSearch"
    case confirmRequestSearch  = "confirmSearch"
}

enum cfiSearchNotification:String {
    case  allRequestSearch     = "SearchAll"
    case  sendRequestSearch    = "sendSearch"
    case recievedRequestSearch = "recieveSearch"
    case confirmRequestSearch  = "confirmSearch"
}



enum filterNotification:String {
    case  allRequestSearch     = "SearchAll"
    case  sendRequestSearch    = "sendSearch"
    case recievedRequestSearch = "recieveSearch"
    case confirmRequestSearch  = "confirmSearch"
}


enum PastSearchNotification:String {
    case  startSearch = "startSearch"
}



enum sortNotification:String {
 case fevtSearch          = "fevtSearch"
 case intSearch           = "intSearch"
 case fevtSearchDismissed = "fevtSearchDismissed"
 case intSearchDismissed  = "intSearchDismissed"
}

enum stepOneEnum:String{
    case selected    = "Yes"
    case notSelected = "No"
    case nutral      = "default"
}


 enum controllerName: String {
    case instLogin      = "InstituteLoginViewController"
    case studentLogin   = "StudentLoginWithSocialAccountViewController"
    case setting        = "SettingVC"
    case forgotPassword = "ForgotPasswordViewController"
    case eventSelect    = "RegisterEventVC"
    case register       = "RegistrationViewController"
    case varifyOtp      = "VarifyOtpViewController"
    case changePassword = "ChangePasswordViewController"
    case stepOne        = "StepOneProfileVC"
    case stepTwo        = "StepTwoProfileVC"
    case stepThree      = "StepThreeProfileVC"
    case stepFour       = "StepFourProfileVC"
}



//===========================================================
//MARK: - LeftScreen Name
//===========================================================
enum LeftScreen:Int {
        case Home,TrackBus,Notification,ViewRouts,Settings,SignOut
    
}
enum Language: String {
    
    case english    = "en"
    case arabic     = "ar"
    case hindi      = "hi"
    case spanish    = "es"
    
    var semantic: UISemanticContentAttribute {
        switch self {
            case .arabic:
                return .forceRightToLeft
            default:
                return .forceLeftToRight
        }
    }
    
    static var language: Language {
        get {
            if let languageCode = UserDefaults.standard.string(forKey: LocalizationConst.LanguageKey),
                let language = Language(rawValue: languageCode) {
                return language
            } else {
                return Language.english
            }
        }
        set {
            guard language != newValue else {
                return
            }
            UserDefaults.standard.set(newValue.rawValue, forKey: LocalizationConst.LanguageKey)
            UserDefaults.standard.synchronize()
          //  UIView.appearance().semanticContentAttribute = newValue.semantic
            UIApplication.shared.windows[0].rootViewController = UIStoryboard(
                name: "Main",
                bundle: nil
                ).instantiateInitialViewController()
        }
    }
}




struct GmailUser {
    var userId: String
    var idToken: String?
    var fullName: String
    var givenName: String
    var familyName: String
    var email: String
    var profileImageUrl:URL?
    var profileImage:UIImage?
    var description: String {
        return self.fullName
    }
    
//    var token: String {
//        return self.idToken
//    }
    
    init(userId: String, idToken: String?, fullName: String, givenName: String, familyName: String, email: String,profileImageUrl:URL?,profileImage:UIImage?) {
        self.userId          = userId
        self.idToken         = idToken
        self.fullName        = fullName
        self.givenName       = givenName
        self.familyName      = familyName
        self.email           = email
        self.profileImageUrl = profileImageUrl
        self.profileImage     = profileImage
    }
}



struct FaceBookUser {
    let userId: String
    let fullName: String
    let firstName: String
    let lastName: String
    let email: String
    let profileImageUrl:URL?
    let profileImage:UIImage?
    var description: String {
        return self.fullName
    }
    
    init(userId: String, fullName: String, firstName: String, lastName: String, email: String,profileImageUrl:URL?,profileImage:UIImage?) {
        self.userId          = userId
        self.fullName        = fullName
        self.firstName       = firstName
        self.lastName        = lastName
        self.email           = email
        self.profileImageUrl = profileImageUrl
        self.profileImage    = profileImage
    }
}
