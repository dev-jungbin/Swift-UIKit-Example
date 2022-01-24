//
//  ViewController.swift
//  Moya-Example
//
//  Created by 1v1 on 2022/01/18.
//

import UIKit
import Moya

class ViewController: UIViewController {

    /// MoyaTarget과 상호작용하는 MoyaProvider를 생성하기 위해 MoyaProvider 인스턴스 생성
    private let authProvider = MoyaProvider<LoginServices>()
    
    /// ResponseModel
    var userData: SignInModel?
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var time = "2022-01-17T18:48:42.040Z"
        resultLabel.text = "\(time.serverTimeToString(forUse: .forNotification))"
        
    }

    
    @IBAction func tapSignInBtn(_ sender: Any) {
        signIn()
    }
    
}

extension ViewController {
    func signIn() {
        let param = SignInRequest(email: "ku2@korea.ac.kr", password: "123456", deviceToken: "eylkj;lkj;")
        authProvider.request(.signIn(param: param)) { result in
            switch result {
            case .success(let result):
                do {
                    self.userData = try result.map(SignInModel.self)
                    print(self.userData)
                } catch(let err) {
                    print("parsing err: ", err.localizedDescription)
                }
            case .failure(let err):
                print("request err: ", err.localizedDescription)
            }
        }
    }
}

//extension ViewController {
//    func signIn() {
//        MusicHugAPI.shared.getDetailMusicHugAPI(hugID: “1”) { networkResult in
//            switch networkResult {
//            case .success(let res):
//                if let data = res as? MusicHugDetailData {
//                    self.roomChatData = [data]
//                    self.chatCV.reloadData()
//                }
//                print(“success”)
//            case .requestErr(let msg):
//                if let message = msg as? String {
//                    print(message)
//                }
//            case .pathErr:
//                print(“pathErr”)
//            case .serverErr:
//                print(“serverErr”)
//            case .networkFail:
//                print(“networkFail”)
//            }
//        }
//    }
//}

extension String {
    /// 형식확인! "2021-11-28T18:56:42.040Z"
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            print("toDate() convert error")
            return Date()
        }
    }
    
    enum TimeStringCase {
        case forNotification
        case forDefault
    }
    
    func serverTimeToString(forUse: TimeStringCase) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd"
        
        let currentTime = Int(Date().timeIntervalSince1970)
        
        switch forUse {
        case .forNotification:
            let getTime = self.toDate().timeIntervalSince1970
            let displaySec = currentTime - Int(getTime)
            let displayMin = displaySec / 60
            let displayHour = displayMin / 60
            let displayDay = displayHour / 24

            if displayDay >= 1 {
                return dateFormatter.string(from: self.toDate())
            } else if displayHour >= 1 {
                return "\(displayHour)시간 전"
            } else if displayMin >= 1 {
                return "\(displayMin)분 전"
            } else {
                return "\(displaySec)초 전"
            }
        case .forDefault:
            return dateFormatter.string(from: self.toDate())
        }
    }
}
