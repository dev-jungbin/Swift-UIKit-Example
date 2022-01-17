//
//  ViewController.swift
//  DynamicTableVIewCell-Example
//
//  Created by 1v1 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVC.ID, for: indexPath) as? CustomTVC else { return UITableViewCell() }
        if indexPath.row == 1 {
            cell.label.text = "호앵"
        } else {
            cell.label.text = "호애애애ㅐㅇ애애애애ㅐ애애애애ㅐ애애애애애앵제발되어라"
        }
        cell.secondLabel.text = "이건세컨라벨"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

class CustomTVC: UITableViewCell {
    static let ID = "CustomTVC"
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.lineBreakStrategy = .hangulWordPriority
        }
    }
    @IBOutlet weak var secondLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
