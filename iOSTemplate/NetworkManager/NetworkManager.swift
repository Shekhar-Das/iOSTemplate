//
//  NetworkManager.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 20/4/23.
//
//
//  WebServiceManager.swift


import UIKit
import Alamofire
import CoreLocation
import RxSwift
import RxAlamofire
import MBProgressHUD
import SwiftyJSON
//import YPImagePicker
class WebServiceManager: NSObject {
    static let instance       = WebServiceManager()
    typealias CompletionBlock = (Int,[String:Any]) -> Swift.Void
    private let disposeBag    = DisposeBag()
    private var manager: SessionManager!
    
    //===========================================================
    //MARK: - Initialization Methods
    //===========================================================
    private override init() {
        super.init()
        self.configureManager()
    }
    
    /*
     apiKey = h3rHjcEkc4B3MsUwE27BrQn3w6atfgLg
     appId = 1601973955
     */
    
    
    static var headers:HTTPHeaders? {
        if let token = AppSession.authToken {
            return ["Accept":"application/json",ServiceConst.Authorization:"Bearer \(token)","apiKey":"h3rHjcEkc4B3MsUwE27BrQn3w6atfgLg","appId":"1601973955"]
        }
        return ["Accept":"application/json","apiKey":"h3rHjcEkc4B3MsUwE27BrQn3w6atfgLg","appId":"1601973955"]
    }
    }

//***********************************************//
// MARK: Login Webservices
//***********************************************//
extension WebServiceManager {
    //***********************************************//
    // MARK: Login With Mobile Number
    //***********************************************//
    func loginUsingPhoneWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/authentication"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    // checking fake api is working or not
    //_ kidId:String
    //https://fakestoreapi.com/products
    func fakeProducts(_ data:[String: Any], block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl + "products"
        print("STD", fakeProducts)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }



func loginWithGoogle(_ imageData:Data?,_ params:[String:String], withCompletion block:@escaping CompletionBlock){
       let completeUrl = ServiceConst.BaseUrl+"user/authentication"
    
    print(completeUrl,params)
    
    callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: params, withCompletionBlock: block)
   }
    
    
    
    //***********************************************//
    // MARK: Add New Kid
    //***********************************************//
    func addNewKidWithDetails(_ imageData:Data?,_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"kid/add"
        
        print("reqesuted Params:-\(params)....... Request URL:- \(completeUrl),")
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: params, withCompletionBlock: block)
       }
    
    
    //***********************************************//
    // MARK:Kid Profile Gmail Verify
    //***********************************************//
    func kidGetOtpForMobileDetails(_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"kid/verify/phone"
        print(completeUrl,data)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
   
    
    
    //***********************************************//
    // MARK:Kid Profile Email Verify
    //***********************************************//
    func kidGetOtpForUserEmailDetails(_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"kid/verify/email"
        
        print(completeUrl,data)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Validate Email and Phone
    //***********************************************//
    func validateKidWithDetails(_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"kid/check/duplicate"
        
        print("reqesuted Params:-\(params)....... Request URL:- \(completeUrl),")
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: params, withCompletionBlock: block)
       }
    
    
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Update  Kid
    //***********************************************//
    func updateKidWithDetails(_ imageData:Data?,_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"kid/update"
        
        print("reqesuted Params:-\(params)....... Request URL:- \(completeUrl),")
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: params, withCompletionBlock: block)
       }
    
    
    
    
    
    //***********************************************//
    // MARK: Get Kids List
    //***********************************************//
    func getKidsListWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"kids/get/"+UserModel.getObject().userId
        
        print("Request URL:- \(completeUrl)")
        callGetRequestWithCompleteUrl(url:completeUrl , withCompletionBlock: block)
       }
    
    
    
    
    //***********************************************//
    // MARK: Get Kid
    //***********************************************//
    func getKidWithDetails(_ kidId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"kid/get/"+kidId
        
        print("Request URL:- \(completeUrl)")
        callGetRequestWithCompleteUrl(url:completeUrl , withCompletionBlock: block)
       }
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Delete Kid
    //***********************************************//
    func deleteKidWithDetails(_ params:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"kid/delete"
        print("Request URL:- \(completeUrl)","Request Params:- \(params)")
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: params, withCompletionBlock: block)
       }
    

    
    
    
    func deleteSingleEventImageWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/image/delete"
        
        print(completeUrl,data)
        
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    
//    func addSingleEventWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
//        let completeUrl = ServiceConst.BaseUrl+"event/add"
//
//        print(completeUrl,data)
//        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
//    }
    
    
    
    
    //***********************************************//
    // MARK: Get Home Event List
    //***********************************************//
    func getAllEventListWithDetails(_ params:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"events/get"
        
        print(completeUrl,params)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: params, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Age Group List for event
    //***********************************************//
    func getEventAgeListWithDetails(_ params:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"get/age/groups"
        
        print(completeUrl,params)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    //***********************************************//
    // MARK: Get Age Group List for event
    //***********************************************//
    func getKidAgeListWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"get/kid/age/groups"
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    
    //***********************************************//
    // MARK: Get Home Event List
    //***********************************************//
    func getEventByUserIdWithDetails(_ eventId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/get/"+eventId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    //details
    

    
    
    //***********************************************//
    // MARK: Get Home Event List
    //***********************************************//
    func getEventDetailsByUserIdWithDetails(_ eventId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/details/"+eventId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
 
    
    
    //*****************************************//
    // MARK: Get Event Favourite User's List
    //****************************************//
    func getEventFavouriteUsersListWithDetails(_ eventId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/user/interested/"+eventId
        //http://3.143.78.191/api/event/user/interested
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Delete Event
    //***********************************************//
    func deleteEventWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/delete"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Add Venue with details
    //***********************************************//
    func addVenueWithDetails(_ imageData:Data?,_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"venue/add"
        print(completeUrl,param)
        
      callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: param, withCompletionBlock: block)
    }
    
    //****************************************//
    // MARK: Update Venue with details
    //****************************************//
    func updateVenueWithDetails(_ imageData:Data?,_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"venue/update"
        print(completeUrl,param)
        
      callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: param, withCompletionBlock: block)
    }
        
    
    //***********************************************//
    // MARK: Get Venue List with details
    //***********************************************//
    func getVenueListWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"venues/get"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Delete Venue with details
    //***********************************************//
    func deleteVenueWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"venue/delete"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Make Venue Favourite
    //***********************************************//
    func makeVenueFavouriteWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"venue/make/favourite"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    
    
    
    //***********************************************//
    // MARK: Add Remove Event In Fevt
    //***********************************************//
    func addRemoveEventFromFevtWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/make/favourite"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Favourite Events List
    //***********************************************//
    func getFavouriteEventsListWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/favourite/events/"+UserModel.getObject().userId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    /// event/similer/
    
    
    
    
    //***********************************************//
    // MARK: Get Similar Events List
    //***********************************************//
    func getSimilarEventsListWithDetails(_ userId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/similer/"+userId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Get Similar Events List
    //***********************************************//
    func getAllEventsListWithDetails(_ userId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"event/similer/"+userId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Get  Events List Create by user
    //***********************************************//
    func getMyEventsListWithDetails(_ userId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/events/get/"+userId
        
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    
    
    //***********************************************//
    // MARK: Get  Booked Events List Create by user
    //***********************************************//
    func getBookedEventsListWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/get/tickets"
        print(completeUrl)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams:data, withCompletionBlock: block)
    }
    
    
    
    //*************************************//
    // MARK: Get Settings List
    //************************************//
    func getUserSettingsWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"settings/user/"+UserModel.getObject().userId
        
        print(completeUrl)
        
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    //*************************************//
    // MARK: Get Notification List
    //************************************//
    func getUserNotificationListWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"notifications"
        
        print(completeUrl)
        
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    

    
    //*************************************//
    // MARK: Delete Notification
    //************************************//
    func getDeleteNotificationWithDetails(_ notificationId :String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"notification/delete/"+notificationId
        
        print(completeUrl)
        
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    //*************************************//
    // MARK: Read Notification
    //************************************//
    func getReadUserNotificationListWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"notification/mark-as-read"
        
        print(completeUrl)
        
    callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    //*************************************//
    // MARK: Update User's Settings
    //************************************//
    func getUpdateUserSettingsWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/add/setting"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    //***********************************************//
    // MARK: Like Dislike
    //***********************************************//
    func likeUnlikePost(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/like-unlike"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }

    
    
    
    
    //***********************************************//
    // MARK: Get Post Like  List
    //***********************************************//
    func getPostLikeListWithDetails(_ postId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/liked/users/"+postId
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Comment Like  List
    //***********************************************//
    func getCommentLikeListWithDetails(_ commentId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/comment/liked/users/"+commentId
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    func reportUserWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/report"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    func blockUserWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/blocked"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    func reportCommentOrPost(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/report"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    func bookEventWithDetails(_ parameters:[String:Any],withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"payment"
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: parameters, withCompletionBlock: block)
       }
    
    
    func getTicketWithDetails(_ ticketKey:String,withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"get/ticket/"+ticketKey
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
       }
    
    
    
    
    func getUpdateTicketAcceptRejectWithDetails(_ param:[String:Any],withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"ticket/approved"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
       }
    
    
    func getSavedCardWithDetails(_ userId:String,withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"get/saved/card/"+userId
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
       }
    
    
    func getScannedBarCodeWithDetails(_ data:[String:Any],withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"ticket/scan"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
       }
    
    
    
    func purchaseExperienceUsingApplePayWithDetails(_ parameters:[String:Any],withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"apple_payment_api"
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: parameters, withCompletionBlock: block)
       }
    
    
    func purchaseExperienceUsingSavedCardWithDetails(_ parameters:[String:Any],withCompletionBlock block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"paywithsavedcard"
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: parameters, withCompletionBlock: block)
       }

    
    
    func getLatLongFromPlaceId(placeId:String,block:@escaping CompletionBlock){
        let url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeId)&key=AIzaSyCy9I5GYw7ci3W9HtMKtenwaYlynXl0Els"
        callGetRequestWithCompleteUrl(url: url, withCompletionBlock: block)
    }
    
    //***********************************************//
    // MARK: User Profile
    //***********************************************//
    func getUserProfileDetails(_ userId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/get/\(userId)"
        print(completeUrl)
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Update User Name
    //***********************************************//
    func getUpdateUserNameDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"generate/username"
        print(completeUrl)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Update User Name
    //***********************************************//
    func getcheckUserNameWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/check/username"
        print(completeUrl)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    //***********************************************//
    // MARK:  Referal user list
    //***********************************************//
    func getReferedUserListWithDetails(_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/referrered/list/"+UserModel.getObject().userId
        print(completeUrl)
        callGetRequestWithCompleteUrl(url:completeUrl, withCompletionBlock: block)
    }
    
    
    
    
    
    
    //***********************************************//
    // MARK: Validate Referal Code
    //***********************************************//
    func getValidateReferalCodeWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/redeem/referrer-code"
        print(completeUrl)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Update User Profile
    //***********************************************//
    func getUpdateUserProfileDetails(_ imgData:Data?,_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/update"
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imgData, "jpg", andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    //***********************************************//
    // MARK: Create Group
    //***********************************************//
    func createGroupWithDetails(_ imgData:Data?,_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/add"
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imgData, "jpg", andParams: data, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Mention (User Name list)
    //***********************************************//
    func getUserNameListWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"get/usernames"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Invite Member In Group
    //***********************************************//
    func getInviteMemberWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/invite"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Update Group
    //***********************************************//
    func updateGroupWithDetails(_ imgData:Data?,_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/update"
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imgData, "jpg", andParams: data, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Update Group Image
    //***********************************************//
    func updateGroupImageWithDetails(_ imgData:Data?,_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/update/image"
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imgData, "jpg", andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Join Group
    //***********************************************//
    func joinGroupRequestWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/join"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    //***********************************************//
    // MARK: Accept Reject Invitation Group
    //***********************************************//
    func acceptRejectjoinGroupRequestWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/request/accept"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    //**********************************//
    // MARK: Delete Group
    //*********************************//
    func deleteGroupWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/delete"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    
    //******************************************************//
    // MARK: Remove User From Group
    //******************************************************//
    func adminRemoveUserFromGroupWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/remove/member"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //******************************************************//
    // MARK: User Leave Group
    //******************************************************//
    func userLeaveGroupWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/exit/member"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: Get Group List
    //***********************************************//
    func getGroupListWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"groups/get"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Group Details List
    //***********************************************//
    func getGroupDetails(_ groupId:String,block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/get/"+groupId
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Add User Group Sub Admin
    //***********************************************//
    func addSubAdminInGroupWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/add/subadmins"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Delete Invited  User from Group
    //***********************************************//
    func deleteInivitedUserWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/delete/invited/user"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Delete Invited  User from Group
    //***********************************************//
    func deleteJoinGroupRequestByUserWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/request/delete"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    //***************************************//
    // MARK: Add Post or Activity In Group
    //***************************************//
    func addNewActivity(_ imageData:Data?,_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"post/add"
        
        print(completeUrl,params)
        
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: params, withCompletionBlock: block)
       }
    
    
    //***************************************//
    // MARK: Update Post or Activity In Group
    //***************************************//
    func updateActivity(_ imageData:Data?,_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"post/update"
        
        print(completeUrl,params)
        
        callUploadImageRequestWithCompleteUrl(url: completeUrl, imageData, "jpg", andParams: params, withCompletionBlock: block)
       }
    
    
    
    //***********************************************//
    // MARK: Delete Actvity or Post
    //***********************************************//
    func deleteActivityWithDetails(_ param:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/delete"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    //**************************************//
    // MARK: Get Group Post or Activity List
    //*************************************//
    func getActivityList(_ params:[String:String], withCompletion block:@escaping CompletionBlock){
           let completeUrl = ServiceConst.BaseUrl+"posts/get"
        print(completeUrl,params)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: params, withCompletionBlock: block)
       }
    
    //****************************************//
    // MARK: Add Comment on Actvity on Post
    //****************************************//
    func addCommentOnPostWithDetails(_ imageData:Data?,_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/add/comment"
        print(completeUrl,param)
        
        callUploadImageAndVideoRequestWithCompleteUrl(url: completeUrl, imageData, nil, andParams: param, withCompletionBlock: block)
    }
    
    
    //****************************************//
    // MARK: Update Comment on Actvity on Post
    //****************************************//
    func updateCommentOnPostWithDetails(_ imageData:Data?,_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/edit/comment"
        print(completeUrl,param)
        
        callUploadImageAndVideoRequestWithCompleteUrl(url: completeUrl, imageData, nil, andParams: param, withCompletionBlock: block)
    }
    
    
    
    
    //****************************************//
    // MARK: Delete Comment on Actvity on Post
    //****************************************//
    func deleteCommentWithDetails(_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/delete/comment"
        print(completeUrl,param)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    
    //****************************************//
    // MARK: Delete Comment on Actvity on Post
    //****************************************//
    func likeOnCommentWithDetails(_ param:[String:String],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/comment/like"
        print(completeUrl,param)
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: param, withCompletionBlock: block)
    }
    
    
    
    
    
    
    //******************************************//
    // MARK: Get Actvity Comment List
    //******************************************//
    func getPostCommentListWithDetails(_ data:[String:Any],_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/comment/get"
        
        print(completeUrl)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
        
    
    //******************************************//
    // MARK: Get Actvity Details List
    //******************************************//
    func getActivityWithDetails(_ activityId:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"post/get/"+activityId
        print(completeUrl)
        
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    
    //***********************************//
    // MARK: Get Explore List
    //**********************************//
    func getExploreGroupListWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"groups/explore"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    //***********************************************//
    // MARK: Get Group Post List
    //***********************************************//
    func getGroupPostListWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"group/get/events"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK:User Profile Gmail Verify
    //***********************************************//
    func getOtpForUserMobileDetails(_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/verify/phone"
        
        
        print(completeUrl,data)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
   
    
    
    //***********************************************//
    // MARK:User Profile Email Verify
    //***********************************************//
    func getOtpForUserEmailDetails(_ data:[String:String],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/verify/email"
        
        print(completeUrl,data)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //***********************************************//
    // MARK: User Interest List
    //***********************************************//
    func getUserIntrestList(_ type:String,_ block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"get/interests/" + type
        callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
    }
    
    
    
    //***********************************************//
    // MARK: Get Category
    //***********************************************//
    func getEventCategoyrList(_ data:[String:Any],_  block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"get/categories"
        //callGetRequestWithCompleteUrl(url: completeUrl, withCompletionBlock: block)
        
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }


    
    //***********************************************//
    // MARK: Varify OTP
    //***********************************************//
    func varifyOTPWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"user/verify/code"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }

    
    
    //***********************************************//
    // MARK: Resend OTP
    //***********************************************//
    func resendOTPWithDetails(_ data:[String:Any],block:@escaping CompletionBlock){
        let completeUrl = ServiceConst.BaseUrl+"resend/verification/code"
        callPostRequestWithCompleteUrl(url: completeUrl, andParams: data, withCompletionBlock: block)
    }
    
    

    
    func callUploadImageRequestWithCompleteUrl(url:String,_ attachMentData: Data?,_ exten: String, andParams parameters:[String:String],withCompletionBlock block:@escaping CompletionBlock){
        manager.upload(multipartFormData: { multipartFormData in
            if let imageData = attachMentData {
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpg")
            }
            
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }}, to: url, method: .post, headers: WebServiceManager.headers,
                encodingCompletion: { encodingResult in
  switch encodingResult {
  case .success(let upload, _, _):
      upload.response {  response in
       if let data = response.data {
        do{
         let dict = try JSON(data: data)
            if let data = dict.rawValue as? [String : Any] {
                print(WebServiceManager.headers)
                block(200,data)
            }
        print(dict)
            
        }catch{
            print("erroMsg",response)
        }
        }
        
      }
                    case .failure(let encodingError):
                        block(0,["error":encodingError.localizedDescription])
                    }
        })
    }
        
    
    func callUploadImageAndVideoRequestWithCompleteUrl(url:String,_ imgData: Data?,_ videoData: Data?, andParams parameters:[String:String],withCompletionBlock block:@escaping CompletionBlock){
        manager.upload(multipartFormData: { multipartFormData in
            if let imageData = imgData {
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpg")
            }
                        
              if let vData = videoData {
                 multipartFormData.append(vData, withName: "video", fileName: "video.mp4", mimeType: "video/mp4")
                
                        }
                        
                        
            
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }}, to: url, method: .post, headers: WebServiceManager.headers,
                encodingCompletion: { encodingResult in
  switch encodingResult {
  case .success(let upload, _, _):
      upload.response {  response in
       if let data = response.data {
        do{
         let dict = try JSON(data: data)
            if let data = dict.rawValue as? [String : Any] {
                print(WebServiceManager.headers)
                block(200,data)
            }
        print(dict)
            
        }catch{
            print("erroMsg",response)
        }
        }
                            
                        }
                    case .failure(let encodingError):
                        block(0,["error":encodingError.localizedDescription])
                    }
        })
    }
    
    
    
    
    
    
    
    
    
    
    }

//***********************************************//
// MARK: Alamofire Calling Methods
//***********************************************//
extension WebServiceManager {
    //===========================================================
    //MARK: - Alamofire Methods
    //===========================================================
    /**
     *  Configure Alamofire Manger
     */
    private func configureManager() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = ServiceConst.TimeOut
        manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    
    
    /**
     *  This function is use to get data from server using HTTP GET method.
     *  @param completeUrl BaseUrl with ServicePath.
     *  @param dictData    Params in json(NSDictionary).
     *  @param block       CompletionBlock.
     */
    private func callGetRequestWithCompleteUrl(url:String, andData data:[String:Any]? = nil,withCompletionBlock block:@escaping CompletionBlock) {
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        print("Request Method:- Get"," Requested URL:-\(url)","Requested Params:-\(data)",WebServiceManager.headers)
        
        
        manager.rx.responseJSON(.get, url,parameters :data,encoding : URLEncoding.default,headers : WebServiceManager.headers)
            .observeOn(MainScheduler.instance)
            .debounce(.nanoseconds(1), scheduler:MainScheduler.instance)
            .subscribe(onNext: {  (r, json) in
                switch r.statusCode {
                case 200 :
                  //
                    print("RequestUrl:\(url)\nRequestParams:\(data)\nResponseCode:\(r.statusCode)\nResponseData:\(json))",WebServiceManager.headers)
                    block(r.statusCode,json as! [String : Any])
                    
                case 201...502:
                  //
                    print("RequestUrl:\(url)\nRequestParams:\("")\nResponseCode:\(r.statusCode)\nResponseData:\(json))",WebServiceManager.headers)
                    block(r.statusCode,json as! [String : Any])
                    break
                default :
                   //
                    let statusCode = r.statusCode
                    print("RequestUrl:\(url)\nRequestParams:\("")\nResponseCode:\(r.statusCode)\nError:\(0)")
                    block(statusCode,["error":"Faliure"])
                    break
                }
            }, onError: { (error) in
                let mode  = error.localizedDescription
                print(mode)
               //
                print("RequestUrl:\(url)\nRequestParams:\("")\nResponseCode:\(0)\nError:\(error)")
                block(0,["error":error.localizedDescription])
            })
            .disposed(by: disposeBag)
        
    }
    /**
     *  This function is use to get data from server using HTTP POST method.
     *
     *  @param completeUrl BaseUrl with ServicePath.
     *  @param dictData    Params in json(NSDictionary).
     *  @param block       CompletionBlock.
     */
    private func callPostRequestWithCompleteUrl(url:String, andParams params:[String:Any],withCompletionBlock block:@escaping CompletionBlock) {
        
        print("Requested Method:- Post"," Requested URL:-\(url)","Requested Params:-\(params)")
        
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        manager.rx.responseJSON(.post, url,parameters :params,encoding : URLEncoding.default,headers : WebServiceManager.headers)
            
            .debounce(.nanoseconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: {  (r, json) in
                switch r.statusCode {
                case 200 :
                //
                    print("RequestUrl:\(url)\nRequestParams:\(params)\nResponseCode:\(r.statusCode)\nResponseData:\(json))")
                    block(r.statusCode,json as! [String : Any])
                    
                case 201...502:
                  //
                    print("RequestUrl:\(url)\nRequestParams:\(params)\nResponseCode:\(r.statusCode)\nResponseData:\(json))")
                    block(r.statusCode,json as! [String : Any])
                    break
                default :
                    ///
                    let statusCode = r.statusCode
                    print("RequestUrl:\(url)\nRequestParams:\(data)\nResponseCode:\(r.statusCode)\nError:\(0)")
                    block(statusCode,["error":"Faliure"])
                    break
                }
            }, onError: { (error) in
                let errorCode = error.localizedDescription
                
                print(errorCode)
               //
                print("RequestUrl:\(url)\nRequestParams:\("")\nResponseCode:\(0)\nError:\(error)")
                block(0,["error":error.localizedDescription])
            })
            .disposed(by: disposeBag)
    }
    
    
    //***********************************************//
    // MARK: Private Service to access Scaned card data 9
    //***********************************************//
    private func cardCallPostRequestWithCompleteUrl(url:String, andData data:[String:Any],withCompletionBlock block:@escaping CompletionBlock) {
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        manager.rx.responseJSON(.post, url,parameters :data,encoding : JSONEncoding.default,headers : WebServiceManager.headers)
            .debounce(.milliseconds(0), scheduler: MainScheduler.instance)
            .subscribe(onNext: {  (r, json) in
                switch r.statusCode {
                case 200 :
                  //
                    print("RequestUrl:\(url)\nRequestParams:\(data)\nResponseCode:\(r.statusCode)\nResponseData:\(json))",WebServiceManager.headers)
                    block(r.statusCode,json as! [String : Any])
                    
                case 201...502:
                    //
                    print("RequestUrl:\(url)\nRequestParams:\(data)\nResponseCode:\(r.statusCode)\nResponseData:\(json))")
                    block(r.statusCode,json as! [String : Any])
                    break
                default :
                   //
                    let statusCode = r.statusCode
                    print("RequestUrl:\(url)\nRequestParams:\(data)\nResponseCode:\(r.statusCode)\nError:\(0)")
                    block(statusCode,["error":"Faliure"])
                    break
                }
            }, onError: { (error) in
                let errorCode = error.localizedDescription
                
                print(errorCode)
              //
                print("RequestUrl:\(url)\nRequestParams:\("")\nResponseCode:\(0)\nError:\(error)")
                block(0,["error":error.localizedDescription])
            })
            .disposed(by: disposeBag)
    }
    
    
    
    /**
     *  Cancel All Alamofire Operation.
     */
    func cancelAllOperations() {
        manager.rx.base.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
        }
    }
}
