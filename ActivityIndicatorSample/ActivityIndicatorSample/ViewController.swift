//
//  ViewController.swift
//  ActivityIndicatorSample
//
//  Created by 1v1 on 2021/12/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var completeView: UIView!
    lazy var activityIndicator: UIActivityIndicatorView = {
        // 해당 클로저에서 나중에 indicator 를 반환해주기 위해 상수형태로 선언
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        activityIndicator.center = self.view.center
        
        // 기타 옵션
        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        
        // stopAnimating을 걸어주는 이유는, 최초에 해당 indicator가 선언되었을 때, 멈춘 상태로 있기 위해서
        activityIndicator.stopAnimating()
        
        return activityIndicator
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)
        
        completeView.isHidden = true
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.activityIndicator.stopAnimating()
            self.completeView.isHidden = false
            
        }
    }
}

