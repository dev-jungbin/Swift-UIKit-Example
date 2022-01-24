//
//  SignInRequest.swift
//  Moya-Example
//
//  Created by 1v1 on 2022/01/18.
//

import Foundation

struct SignInRequest: Codable {
    var email: String = ""
    var password: String = ""
    var deviceToken: String = ""
}

struct SignInModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInResponse?
}

struct SignInResponse: Codable {
    let user: UserModel
    let accessToken: String
    
    struct UserModel: Codable {
        let userID: Int
        let email: String
        let universityID: Int
        let firstMajorName, secondMajorName: String
        let isReviewed: Bool

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case email
            case universityID = "universityId"
            case firstMajorName, secondMajorName, isReviewed
        }
    }
}
