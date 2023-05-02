//
//  Constant.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import UIKit

//===========================================================
//MARK: - GoogleMap Const
//===========================================================
struct GoogleConst {

    static let ClientId = "345583132654-4nug7c3e9k2n6526n5h4h9734f44uejv.apps.googleusercontent.com"
    
    static let APIKey = "AIzaSyCqZP8Gxh5fosclPpr4dbH25Ob2LwYcU24"
}




//===========================================================
//MARK: - Stripe Const
//===========================================================
struct StripeConst {
    static let PublishableKeyTest = "pk_test_51Jwe6YGejXjHMlOb3vquGMCFwocXEPHSXlboMg4ZXVf7hxCzlJxJp4RE8r2rlTpp1cAykEoHZin8sAiz75eabRJJ00XqzLe2MW"
    static let PublishableKeyLive = "pk_live_51Jwe6YGejXjHMlObKByy0rkQkOiQGdnVDdGrUTCvOxrBBZ6XaarCurDryXCrXO9C0tV42QN7l7PZOM70BE8iIhLQ00Ly9CjzNZ"
}


//===========================================================
//MARK: - Localization Const
//===========================================================
struct LocalizationConst {
    static let LanguageKey = "LanguageKey"
}

//===========================================================
//MARK: - UserDefault Constant
//===========================================================
struct UDConst {
    static let DeviceToken              = "DeviceToken"
    static let UserAuthToken            = "UserAuthToken"
    static let User                     = "User"
    static let Notification             = "Notification"
    static let userId                   = "UserId"
    static let userLogin                = "UserLogin"
    static let UserModel                = "UserModel"
    static let kUDAuthorization         = "Authorization"
    static let kUDDeviceToken           = "DeviceToken"
    static let kUDUserID                = "UserID"
    static let kUDIsLoggedIn            = "IsLogin"
    static let kUDWalkThrough           = "WalkThrough"
    static let kUDTimeFormat            = "TimeFormat"
    static let kUDVerifyDate            = "SaveDate"
    static let userLoginType            = "userLoginType"
}

//===========================================================
//MARK: - NotificationKey
//===========================================================
struct NotifConst{
    static let inviteInGroup             = "inviteInGroup"
    static let AcceptGroupInivation      = "AcceptGroupInivation"
    static let GroupJoinReuest           = "GroupJoinReuest"
    static let GroupJoinReuestAdmin      = "GroupJoinReuestAdmin"
    static let MakeGroupSubAdmin         = "MakeGroupSubAdmin"
    static let RemoveFromGroupByAdmin    = "RemoveFromGroupByAdmin"
    static let RemoveFromGroupByMember   = "RemoveFromGroupByMember"
    static let NewEventCreatedInGroup    = "NewEventCreatedInGroup"
    static let NewActivityCreatedInGroup = "NewActivityCreatedInGroup"
    static let ActivityLike              = "ActivityLike"
    static let ActivityComment           = "ActivityComment"
    static let EventPurchase             = "EventPurchase"
    static let TicketScan                = "TicketScan"
    static let EventApproved             = "EventApproved"
}



//===========================================================
//MARK: - ServiceURLs
//===========================================================
struct ServiceConst{
    static let TimeOut       = 30.0
    static let Authorization = "Authorization"
    
    // Live
   // static let BaseUrl = ""
    
   
    // Staging
  static let BaseUrl = "https://fakestoreapi.com/"
 
}
struct StatusCode {
    static let Success      = 200
    static let Fail         = 0
    static let BadRequest   = 400
    static let Unauthorized = 401
    static let Conflict     = 409
    static let error        = 500
}

struct  shortList {
    static let featuredSearch        = "featureSearch"
    static let featuredSearchDismiss = "featureSearchDissmiss"
    static let prefectSearch         = "prefectSearch"
    static let prefectSearchDismiss  = "prefectSearchDismiss"
}

//===========================================================
//MARK: - Alert Constants
//===========================================================
struct AlertMsg{
    static let NoInternet  = "No internet Connection"
    static let ServerError = "Some error occured  please try again later."
    static let logoutMessage            = "Are you sure you want to log out?"
    static let deleteMessage            = "Are you sure you want to delete?"
    static let VersionAlert             = "A new version of Application Name app is available on app store. Please update it now."
    static let UnauthorizedError        = "Kindly Login again your token has been expired"
    static let RegistrationMsg          = "A link has been sent to the email address. Please click on the link and follow the instruction to register."
    static let  ResetPasswordMsg        = "Password has been changed successfully."
    static let VerificationError        = "Please enter correct verification code"
    static let TokenExpireError         = "Your session has expired. Please login again."
    static let TimeoutError             = "The request timed out."
    static let kWaitingAlert            = "Please wait..."
}

