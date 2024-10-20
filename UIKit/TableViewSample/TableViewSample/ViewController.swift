//
//  ViewController.swift
//  TableViewSample
//
//  Created by Lia An on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    let btsImage = ["bts1", "bts2", "bts3", "bts4","bts5","bts6",
                    "bts7"]
    let bts = ["RM","진","슈가","제이홉","지민","뷔","정국"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        btsImage.count
    }
    
    // By Default
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
     */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. 클래스 참조변수 cell 생성
        let cell = UITableViewCell()
        // 2. 구조체 content 생성: set default content config
        var config = cell.defaultContentConfiguration()
        config.text = "\(bts[indexPath.row])"
        config.secondaryText = "\(indexPath.row+1)번째 멤버"
        config.secondaryTextProperties.color = UIColor.red
        config.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        config.textProperties.color = .blue
        config.image = UIImage(named: btsImage[indexPath.row])
        config.imageProperties.maximumSize.height = 100
        // 3. put content config into cell
        cell.contentConfiguration = config
        
        return cell
        
    }

}

