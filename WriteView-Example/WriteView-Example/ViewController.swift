//
//  ViewController.swift
//  WriteView-Example
//
//  Created by 1v1 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeMajorBtn: UIButton!
    @IBOutlet weak var oneLineTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        oneLineTextField.addLeftPadding(16)
        oneLineTextField.addRightPadding(16)
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
        [oneLineTextField, textView].forEach { view in
            view?.layer.borderWidth = 1
            view?.layer.addRadius(radius: 8)
            view?.layer.borderColor = UIColor.lightGray.cgColor
        }

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

extension UITextField {
    ///왼쪽에 여백 주기
    func addLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    ///오른쪽에 여백 주기
    func addRightPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension CALayer {

    func addRadius(_ corners: UIRectCorner, radius: CGFloat, view: UIView) {
        let mask = CAShapeLayer()
        mask.bounds = view.frame
        mask.position = view.center
        mask.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        view.layer.mask = mask
    }

    func addRadius(radius: CGFloat) {
        self.cornerRadius = radius
    }
}
