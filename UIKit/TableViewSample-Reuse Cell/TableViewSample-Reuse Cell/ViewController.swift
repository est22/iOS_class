//
//  ViewController.swift
//  TableViewSample-Reuse Cell
//
//  Created by Lia An on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        print(cell)
        if cell == nil {
            // 나중에 재사용될 때 어떻게 사용된다고 파라미터로 넘기는
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        // optional chaining(?.): the most simple way for unwrapping. nil이면 뒤의 동작을 하지 않고, 아니면 함
        var content = cell?.defaultContentConfiguration()
        // cell? 때문에 content도 옵셔널
        content?.text = "\(indexPath.section)번째 section \(indexPath.row)번째 row"
        cell?.contentConfiguration = content
        
        return cell!
        
    }
    

}

