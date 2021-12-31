//
//  ViewController.swift
//  ActivityIndicatorSample
//
//  Created by 1v1 on 2021/12/31.
//

import UIKit

class ViewController: BaseVC {
    @IBOutlet weak var completeView: UIView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

func setActivityIndicator(view: UIView) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView()
    
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    activityIndicator.center = view.center
    
    // 기타 옵션
    activityIndicator.color = .purple
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = .medium
    
    activityIndicator.stopAnimating()
    return activityIndicator
}
