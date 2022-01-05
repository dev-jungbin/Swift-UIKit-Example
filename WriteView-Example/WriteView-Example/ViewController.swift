//
//  ViewController.swift
//  WriteView-Example
//
//  Created by 1v1 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeMajorBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapChangeMajorBtn(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "후기 작성 학과", preferredStyle: .actionSheet)
        
        let mainAction = UIAlertAction(title: "본전공명", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("본전공명")
        })
        let subAction = UIAlertAction(title: "이중전공명", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("이중전공명")
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        [mainAction, subAction, cancelAction].forEach { action in
            optionMenu.addAction(action)
        }
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
}

