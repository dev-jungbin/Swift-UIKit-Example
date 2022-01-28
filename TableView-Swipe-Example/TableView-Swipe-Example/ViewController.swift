//
//  ViewController.swift
//  TableView-Swipe-Example
//
//  Created by 1v1 on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ["별들의숫자만큼만", "날떠올려줄래", "더많이사랑해줄게!", "오마이가쉬", "돈츄노암머세븨지?"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC") as? CustomTVC else { return UITableViewCell() }
        cell.label.text = data[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "친구 삭제", handler: {(action, view, completionHandler) in
            self.data.remove(at: indexPath.row)
            self.tableView.reloadData()
            completionHandler(true)
       })
        print("리턴되니..?")
        return UISwipeActionsConfiguration(actions: [action])
    }
}
