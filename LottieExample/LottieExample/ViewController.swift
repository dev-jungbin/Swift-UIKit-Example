//
//  ViewController.swift
//  LottieExample
//
//  Created by 1v1 on 2021/06/29.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let animationView = LOTAnimationView(name:"complete")
       animationView.frame = CGRect(x:0, y:0, width:400, height:400)

       animationView.center = self.view.center

       animationView.contentMode = .scaleAspectFill

       

       mainView.addSubview(animationView)

       animationView.play()
    }


}

