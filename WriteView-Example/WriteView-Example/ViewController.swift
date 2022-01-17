//
//  ViewController.swift
//  WriteView-Example
//
//  Created by 1v1 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeMajorBtn: UIButton!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var oneLineTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        textView.delegate = self
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
        [majorTextField, oneLineTextField].forEach { textField in
            textField?.addLeftPadding(16)
            textField?.addRightPadding(16)
        }
        [majorTextField, oneLineTextField, textView].forEach { view in
            view?.layer.borderWidth = 1
            view?.makeRounded(cornerRadius: 8)
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
extension ViewController: UITextViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        (scrollView.subviews[(scrollView.subviews.count - 1)].subviews[0]).backgroundColor = .blue // verticalIndicator
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

extension UIView {
    func makeRounded(cornerRadius : CGFloat?){
        if let cornerRadius_ = cornerRadius {
          self.layer.cornerRadius = cornerRadius_
        } else {
          // cornerRadius 가 nil 일 경우의 default
          self.layer.cornerRadius = self.layer.frame.height / 2
        }
        self.layer.masksToBounds = true
    }
}

extension UIScrollView {

    var scrollIndicators: (horizontal: UIView?, vertical: UIView?) {

        guard self.subviews.count >= 2 else {
            return (horizontal: nil, vertical: nil)
        }

        func viewCanBeScrollIndicator(view: UIView) -> Bool {
            let viewClassName = NSStringFromClass(type(of: view))
            if viewClassName == "_UIScrollViewScrollIndicator" || viewClassName == "UIImageView" {
                return true
            }
            return false
        }

        let horizontalScrollViewIndicatorPosition = self.subviews.count - 2
        let verticalScrollViewIndicatorPosition = self.subviews.count - 1

        var horizontalScrollIndicator: UIView?
        var verticalScrollIndicator: UIView?

        let viewForHorizontalScrollViewIndicator = self.subviews[horizontalScrollViewIndicatorPosition]
        if viewCanBeScrollIndicator(view: viewForHorizontalScrollViewIndicator) {
            horizontalScrollIndicator = viewForHorizontalScrollViewIndicator
        }

        let viewForVerticalScrollViewIndicator = self.subviews[verticalScrollViewIndicatorPosition]
        if viewCanBeScrollIndicator(view: viewForVerticalScrollViewIndicator) {
            verticalScrollIndicator = viewForVerticalScrollViewIndicator
        }
        return (horizontal: horizontalScrollIndicator, vertical: verticalScrollIndicator)
    }

}
