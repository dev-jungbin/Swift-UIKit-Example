//
//  LogInService.swift
//  Moya-Example
//
//  Created by 1v1 on 2022/01/18.
//

import Foundation
import Moya

enum LoginServices {
    case signIn(param: SignInRequest)
}

extension LoginServices: TargetType {
    /// 서버의 도메인
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    /// 서버의 도메인 뒤에 추가될 path
    var path: String {
        switch self {
        case .signIn:
            return "/auth/login"
        }
    }
    
    /// http method
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    /// 테스트용 Mock Data
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    /// 파라미터 설정
    var task: Task {
        switch self {
        case .signIn(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    /// http header
    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
