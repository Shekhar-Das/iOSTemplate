//
//  LoginVM.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 3/5/23.
//

import Foundation
import UIKit

class LoginVM: NSObject {
    
    func LoginInformation(){
        
       // let params : [String: Any] = JSONEncoder().convertToDictionary(UserModel)
        
        WebServiceManager.instance.fakeProducts( [:]
            , block: {_,_ in
        })  
    }
    
}
