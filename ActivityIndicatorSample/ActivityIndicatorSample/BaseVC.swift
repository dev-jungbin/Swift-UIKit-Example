//
//  BaseVC.swift
//  ActivityIndicatorSample
//
//  Created by 1v1 on 2021/12/31.
//

import UIKit

class BaseVC: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        activityIndicator.center = view.center
        
        // 기타 옵션
        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        
        activityIndicator.stopAnimating()
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)

    }

}
