//
//  KANotificationModel.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//

import UIKit

class KANotificationModel : NSObject {
   var id                     = ""
   var notificationRedirectId = ""
   var readAt                 = ""
   var isRead                 = false
   var title                  = ""
   var message                = ""
   var userName               = "Shekhar"
   var createdAt              = ""
   var image                  = ""
   var notificationType       = ""
   var timeAgo                = ""
   var key                    = ""
    convenience init(_ data:[String:Any]) {
        self.init()
        
        if let key = data["key"] as? String {
            self.key = key
        }
        
        if let id = data["id"] as? String {
            self.id = id
        }
        
        if let timeAgo   = data["time_ago"] as? String {
            self.timeAgo = timeAgo
        }
        
        if let notificationType   = data["type"] as? String {
            self.notificationType = notificationType
        }
        
        
        if let readAt           = data["read_at"] as? String {
            self.readAt         = readAt
        }
        if let isRead           = data["mark_as_read"] as? Bool {
            self.isRead         = isRead
        }
        if let body             = data["data"] as? [String :Any]{
            if let title        = body["subject"] as? String {
                self.title      = title.htmlToString
            }
            if let message      = body["body"] as? String {
                self.message    = message.htmlToString
            }
            if let image          = body["image"] as? String {
                self.image        = image
            }
            if let key = body["key"] as? String {
                self.key = key
            }
            if let notificationType   = body["type"] as? String {
                self.notificationType = notificationType
            }
            
            
            if let userName = body["sender_name"] as? String,userName.isEmpty == false {
                self.userName = userName
            }
            
        }
        if let createdAt        = data["created_at"] as? String {
            self.createdAt      = createdAt
        }
        
        
        if let aps = data["aps"] as? [String:Any], let apsData = aps["alert"] as? [String:Any] {
            if let title        = apsData["title"] as? String {
                self.title      = title.htmlToString
            }
            if let message      = apsData["body"] as? String {
                self.message    = message.htmlToString
            }
        }
        
        
        if let notificationType = data["type"] as? String {
            self.notificationType = notificationType
        }
        
        if let key = data["key"] as? String {
            self.notificationRedirectId = key
        }
    }
}



