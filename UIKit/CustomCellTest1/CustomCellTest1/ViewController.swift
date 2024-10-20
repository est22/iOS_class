//
//  ViewController.swift
//  CustomCellTest1
//
//  Created by Lia An on 9/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let bts = ["RM","진","슈가","제이홉","지민","뷔","정국"]
    let btsArr = ["bts1","bts2","bts3","bts4","bts5","bts6","bts7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 100
//        tableView.delegate = self
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        // MARK: - if-let Binding
//        if let imageView = cell.viewWithTag(1) as? UIImageView {
//            imageView.image = UIImage(named: btsArr[indexPath.row])
//        }
        // MARK: - Optional Chaining
        let imageView = cell.viewWithTag(1) as? UIImageView
        imageView?.image = UIImage(named: btsArr[indexPath.row])
        
        let lblNick = cell.viewWithTag(2) as? UILabel
        lblNick?.text = bts[indexPath.row] // 항상 nil
        
        let lblMemberOrder = cell.viewWithTag(3) as? UILabel
        lblMemberOrder?.text = "\(indexPath.row+1)번째 멤버"
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    
}
