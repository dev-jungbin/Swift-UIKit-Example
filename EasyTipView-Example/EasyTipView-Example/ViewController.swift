//
//  ViewController.swift
//  EasyTipView-Example
//
//  Created by 1v1 on 2021/11/10.
//

import UIKit
import EasyTipView

class ViewController: UIViewController {
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var bellBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapShowBtn(_ sender: Any) {
        var preferences = EasyTipView.globalPreferences
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.blue
//        preferences.drawing.font = UIFont(name: "HelveticaNeue-Light", size: 14)!
        preferences.drawing.textAlignment = NSTextAlignment.justified
        
        preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: -15)
        preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: 15)
        preferences.animating.showInitialAlpha = 0
        preferences.animating.showDuration = 1
        preferences.animating.dismissDuration = 1
        preferences.drawing.arrowPosition = .top
        
        let text = "알림 도착"
        EasyTipView.show(forView: self.bellBtn,
            withinSuperview: self.navigationController?.view,
            text: text,
            preferences: preferences)

    }
    
}

