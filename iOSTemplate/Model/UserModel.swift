//
//  UserModel.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import UIKit

class UserModel: Codable {
    var userId           = ""
    var name             = ""
    var email            = ""
    var dateOfBirth      = ""
    var phone            = ""
    var gender           = ""
    var bio              = ""
    var accessToken      = ""
    var devicetoken      = ""
    var parentController = ""
    var userName         = ""
    var interest         = ""
    var loginType        = ""
    var image            = ""
    var parentId         = ""
    var isEmailVerified  = false
    var socialId         = ""
    var userRole         = 0
    var emailVerifiedAt  = ""
    var apiToken         = ""
    var tokenType        = ""
    var phoneCode        = ""
    var flag             = ""
    var kidsCount        = ""
    var helpSupport = ""
    var privacyPolicy = ""
    var termUses = ""
    var eventCount = 0
    var isPhoneVerified = false
    var isProfileCompleted = false
    var inviteContent = ""
    var inviteLink   = ""
    var points       = "0"
    var completeInviteLink:String {
        return inviteContent + "" + inviteLink
    }
    
    var referalCode = ""
    var isCodeRedeemed = false
    var isHost = false
    
    
    
    convenience init(With dict:[String:Any]) {
        self.init()
        if let points = dict["points"] as? String {
            self.points = points
        }
        
        if let point = dict["points"] as? Int{
            self.points = String(point)
        }
        
        
        
        if let tremsUses = dict["term_uses"] as? String {
            self.termUses = tremsUses
        }
        if let help = dict["help_support"] as? String {
            self.helpSupport = help
        }
        
        if let privacyPolicy = dict["privacy_policy"] as? String {
            self.privacyPolicy = privacyPolicy
        }
        
        if let eventCount = dict["total_events"] as? Int {
            self.eventCount = eventCount
        }
        
        
        if let eventCount = dict["total_events"] as? String,let event = Int(eventCount) {
            self.eventCount = event
        }
        
        
        if let data = dict["data"] as? [String:Any]{
            
            if let eventCount = data["total_events"] as? Int {
                self.eventCount = eventCount
            }
            
            
            if let eventCount = data["total_events"] as? String,let event = Int(eventCount) {
                self.eventCount = event
            }
            
            
        if let userId = data["id"] as? String {
            self.userId = userId
        }
            
            if let userId = data["id"] as? Int {
                self.userId = String(userId)
            }
            
        if let name  = data["name"] as? String{
            self.name = name
        }
        
        
        if  let email           = data["email"] as? String{
            self.email          = email
        }
       
        if let dateOfBirth = data["date_of_birth"] as? String {
          self.dateOfBirth = dateOfBirth
               }
        if let phone           = data["phone"] as? String {
            self.phone         = phone
        }
        if let gender           = data["gender"] as? String {
            self.gender         = gender
        }
        if let bio            = data["bio"] as? String{
            self.bio          = bio
        }
        
        if let accessToken          = data["address"] as? String{
            self.accessToken = accessToken
        }
        
        if let devicetoken         = data["devicetoken"] as? String{
            self.devicetoken       = devicetoken
        }
       
        if let parentController         = data["parent_controller"] as? String{
            self.parentController       = parentController
        }
        
        
        if let userName = data["username"] as? String{
            self.userName = userName
        }
        
        
        if let interest = data["interest"] as? String{
            self.interest = interest
        }
        
        
        if let loginType = data["login_type"] as? String{
            self.loginType = loginType
        }
        
        if let image = data["image"] as? String{
            self.image = image
        }
        
        if let parentId = data["parent_id"] as? String{
            self.parentId = parentId
        }
        
        if let isEmailVerified = data["email_verify"] as? Bool{
            self.isEmailVerified = isEmailVerified
        }
        
        if let socialId = data["social_id"] as? String{
            self.socialId = socialId
        }
        
        if let userRole = data["user_role"] as? Int{
            self.userRole = userRole
        }
        
        if let emailVerifiedAt = data["email_verified_at"] as? String{
            self.emailVerifiedAt = emailVerifiedAt
        }
        
        if let apiToken = data["api_token"] as? String{
            self.apiToken = apiToken
        }
            
            
            if let phoneCode = data["phone_code"] as? String {
                self.phoneCode = phoneCode
            }
            if let flag  = data["flag"] as? String {
                self.flag = flag
            }
        }
        
        
        if let userId = dict["id"] as? String {
            self.userId = userId
        }
            
            if let userId = dict["id"] as? Int {
                self.userId = String(userId)
            }
            
        if let name  = dict["name"] as? String{
            self.name = name
        }
        
        
        if  let email           = dict["email"] as? String{
            self.email          = email
        }
       
        if let dateOfBirth = dict["date_of_birth"] as? String {
          self.dateOfBirth = dateOfBirth
               }
        if let phone           = dict["phone"] as? String {
            self.phone         = phone
        }
        if let gender           = dict["gender"] as? String {
            self.gender         = gender
        }
        if let bio            = dict["bio"] as? String{
            self.bio          = bio
        }
        
        if let accessToken          = dict["address"] as? String{
            self.accessToken = accessToken
        }
        
        if let devicetoken         = dict["devicetoken"] as? String{
            self.devicetoken       = devicetoken
        }
       
        if let parentController         = dict["parent_controller"] as? String{
            self.parentController       = parentController
        }
        
        
        if let userName = dict["username"] as? String{
            self.userName = userName
        }
        
        
        if let interest = dict["interest"] as? String{
            self.interest = interest
        }
        
        
        if let loginType = dict["login_type"] as? String{
            self.loginType = loginType
        }
        
        if let image = dict["image"] as? String{
            self.image = image
        }
        
        if let parentId = dict["parent_id"] as? String{
            self.parentId = parentId
        }
        
        if let isEmailVerified = dict["email_verify"] as? Bool{
            self.isEmailVerified = isEmailVerified
        }
        
        if let socialId = dict["social_id"] as? String{
            self.socialId = socialId
        }
        
        if let userRole = dict["user_role"] as? Int{
            self.userRole = userRole
        }
        
        if let emailVerifiedAt = dict["email_verified_at"] as? String{
            self.emailVerifiedAt = emailVerifiedAt
        }
        
        if let apiToken = dict["api_token"] as? String{
            self.apiToken = apiToken
        }
            
            if let phoneCode = dict["phone_code"] as? String {
                self.phoneCode = phoneCode
            }
            if let flag  = dict["flag"] as? String {
                self.flag = flag
            }
        
        if let tokenType = dict["token_type"] as? String{
            self.tokenType = tokenType
        }
        
        if let accessToken         = dict["access_token"] as? String{
            self.accessToken = accessToken
        }
        
        if let kidsCount = dict["total_kids"] as? String {
            self.kidsCount = kidsCount
        }
        
        if let kidsCount = dict["total_kids"] as? Int {
            self.kidsCount = String(kidsCount)
        }
        
        if let isEmailVerified = dict["is_email_verified"] as? Bool {
            self.isEmailVerified = isEmailVerified
        }
        if let isPhoneVerified = dict["is_phone_verified"] as? Bool {
            self.isPhoneVerified = isPhoneVerified
        }
        if let isProfileCompleted = dict["is_profile_completed"] as? Bool {
            self.isProfileCompleted = isProfileCompleted
        }
        
        if let  inviteContent = dict["invite_content"] as? String {
            self.inviteContent = inviteContent
        }
        
        if let  inviteLink = dict["invite_link"] as? String {
            self.inviteLink = inviteLink
        }
        
        if let referalCode = dict["referrer_code"] as? String {
            self.referalCode = referalCode
        }
        
        if let isCodeRedeemed = dict["is_code_redeemed"] as? Bool {
               self.isCodeRedeemed = isCodeRedeemed
        }
        
        if let isHost = dict["is_host"] as? Bool {
            self.isHost = isHost
        }
        
    }
    
    static func getObject() -> UserModel {
        if let data = UserDefaults.standard.data(forKey: UDConst.UserModel) {
            guard let user = try? JSONDecoder().decode(UserModel.self, from: data) else {
                return UserModel()
            }
            return user
        }
        return UserModel()
    }
    //===========================================================
    //MARK: - Saved Object in UserDefault
    //===========================================================
    func saved() {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(self) else {
            return
        }
        UserDefaults.standard.set(jsonData, forKey: UDConst.UserModel)
        UserDefaults.standard.synchronize()
    }
   static func clear(){
        UserDefaults.standard.removeObject(forKey: UDConst.UserModel)
        UserDefaults.standard.synchronize()
    }
}

