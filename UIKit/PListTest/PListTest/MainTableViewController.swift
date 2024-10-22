//
//  MainTableViewController.swift
//  PListTest
//
//  Created by Lia An on 10/21/24.
//

import UIKit

class MainTableViewController: UITableViewController {
    var bts: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let targetURL = urlWithFileName("bts.plist")
        
        guard fileManager.fileExists(atPath: targetURL.path()) else {
            guard let originURL = Bundle.main.url(forResource: "bts.plist", withExtension: nil) else {
                print(targetURL)
                print("원본을 찾을 수 없습니다.")
                return
            }
            do {
                try fileManager.copyItem(at: originURL, to: targetURL)
            } catch {
                print("복사 실패")
            }
            return
        }
        
        
        guard let bundleURL = Bundle.main.url(forResource: "bts.plist", withExtension: nil) else { return }
        print(bundleURL)
        
        do {
            bts = try NSMutableArray(contentsOf: targetURL, error: ())
        } catch {
            print("PList 읽기 오류")
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        bts = try? NSMutableArray(contentsOf: targetURL, error: ())
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func returnFromAdd(segue:UIStoryboardSegue) {
        guard let bts else { return }
        let indexPath = IndexPath(row: bts.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.scrollToRow(at: indexPath, at:.bottom, animated: true)
        print("return from add")
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
            if imageName.starts(with: "bts") {
                imgProfile?.image = UIImage(named:imageName)
            } else {
                let path = urlWithFileName(imageName, type: .png).path()
                imgProfile?.image = UIImage(contentsOfFile: path)
            }
        }
        
        lblNick?.text = member["nick"];
        lblDesc?.text = member["desc"];
        
        return cell
    }
    
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // 매개변수로 indexPath를 받기 때문에, section or row 기준으로도 수정 설정이 가능하다.
         return true
     }
     
    

     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let target = urlWithFileName("bts.plist")
         if editingStyle == .delete {
         // Delete the row from the data source
         bts?.removeObject(at: indexPath.row)
         try? bts?.write(to:target)
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
             let newMember = ["nick": "차은우", "desc": "New Member", "image": "default"]
             bts?.insert(newMember, at: indexPath.row + 1)
             tableView.insertRows(at: [indexPath], with: .fade)
             
         }
     }
     
    
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         let target = urlWithFileName("bts.plist")
         guard let bts=bts else { return }
         let member = bts[fromIndexPath.row]
         bts.removeObject(at: fromIndexPath.row)
         bts.insert(member, at: to.row)
         
         try? bts.write(to: target)
     
     }
     
    
    
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
         return true
     }
     
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.row  % 2 == 0 ? .delete : .insert
    }
    
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let AddImageViewController = segue.destination as? AddImageViewController else { return }
         AddImageViewController.bts = bts
     }
     
    
}
