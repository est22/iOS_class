//
//  BTSTableViewController.swift
//  BTSApp
//
//  Created by Lia An on 9/4/24.
//

import UIKit

class BTSTableViewController: UITableViewController {
    
    let bts = [["stage_name":"RM", "name":"김남준", "image":"bts1"],
    ["stage_name":"진", "name":"김석진", "image":"bts2"],
    ["stage_name":"슈가", "name":"민윤기", "image":"bts3"],
    ["stage_name":"제이홉", "name":"정호석", "image":"bts4"],
    ["stage_name":"지민", "name":"박지민", "image":"bts5"],
    ["stage_name":"뷔", "name":"김태형", "image":"bts6"],
    ["stage_name":"정국", "name":"전정국", "image":"bts7"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        bts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        let member:[String:String] = bts[indexPath.row]
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        if let image = member["image"]{
            imageView?.image = UIImage(named:image)
        }
        
        
        let lblNick = cell.viewWithTag(2) as? UILabel
        lblNick?.text = member["stage_name"]
        
        let lblDesc = cell.viewWithTag(3) as? UILabel
        lblDesc?.text = "\(indexPath.row+1)번째 멤버"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newVC: DetailViewController? = segue.destination as? DetailViewController
        // guard let으로 하면 코드블록 밖에서도 변수(newVC)를 사용가능.
        guard let newVC,
              // ask indexPath to tableView
              let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        newVC.member = bts[indexPath.row]
        
        
        

        
 
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
