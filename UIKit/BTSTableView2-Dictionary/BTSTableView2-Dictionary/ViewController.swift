//
//  ViewController.swift
//  BTSTableView2-Dictionary
//
//  Created by Lia An on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let bts:[[String:String]] = [["name":"RM", "image":"bts1", "desc":"1번째 멤버"],
    ["name":"진", "image":"bts2", "desc":"2번째 멤버"],
    ["name":"슈가", "image":"bts3", "desc":"3번째 멤버"],
    ["name":"제이홉", "image":"bts4", "desc":"4번째 멤버"],
    ["name":"지민", "image":"bts5", "desc":"5번째 멤버"],
    ["name":"뷔", "image":"bts6", "desc":"6번째 멤버"],
    ["name":"정국", "image":"bts7", "desc":"7번째 멤버"]]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paper", for: indexPath)
        let member = bts[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = member["name"]
        config.textProperties.font = .boldSystemFont(ofSize: 30)
        if let image = member["image"]{
            config.image = UIImage(named: image)
            config.imageProperties.maximumSize.height = 80
        }
        config.secondaryText = member["desc"]
        config.secondaryTextProperties.color = .systemTeal
        
        cell.contentConfiguration = config
        return cell
    }


}

