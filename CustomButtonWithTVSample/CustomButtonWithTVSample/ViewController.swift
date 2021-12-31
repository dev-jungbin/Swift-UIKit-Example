//
//  ViewController.swift
//  CustomButtonWithTVSample
//
//  Created by 1v1 on 2021/12/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.ID) as? CustomTableViewCell else { return UITableViewCell() }
        cell.serinBtn.serinIndex = indexPath
        cell.serinBtn.addTarget(self, action: #selector(action), for: .touchUpInside)
        return cell
    }
    
    @objc func action(sender: CustomButton) {
      print(sender.serinIndex)
    }
}

class CustomTableViewCell: UITableViewCell {
    static let ID = "CustomTableViewCell"
    @IBOutlet weak var serinBtn: CustomButton!
}

class CustomButton: UIButton {
    var serinIndex: IndexPath? = IndexPath()
}
