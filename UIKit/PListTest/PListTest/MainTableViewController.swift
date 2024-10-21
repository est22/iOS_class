//
//  MainTableViewController.swift
//  PListTest
//
//  Created by Lia An on 10/21/24.
//

import UIKit

class MainTableViewController: UITableViewController {
    var bts: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                let fileManage = FileManager.default
        
        guard let bundleURL = Bundle.main.url(forResource: "bts.plist", withExtension: nil) else { return }
        print(bundleURL)
        do {
            bts = try NSArray(contentsOf: bundleURL, error: ())
        } catch {
            print("PList 읽기 오류")
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

 
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
         guard let member = bts?[indexPath.row] as? [String:String] else { return cell }
     
         let imgProfile = cell.viewWithTag(1) as? UIImageView
         let lblNick = cell.viewWithTag(2) as? UILabel
         let lblDesc = cell.viewWithTag(3) as? UILabel
         
         if let imageName = member["image"] {
             imgProfile?.image = UIImage(named:imageName)
         }
         
         lblNick?.text = member["nick"];
         lblDesc?.text = member["desc"];
         
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
