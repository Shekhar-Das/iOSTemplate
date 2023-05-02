//
//  LoginModel.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 2/5/23.
//


import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let loginID, password, applicationID: String
    let noJWT: Bool
    let ipAddress: String

    enum CodingKeys: String, CodingKey {
        case loginID = "loginId"
        case password
        case applicationID = "applicationId"
        case noJWT, ipAddress
    }
}
