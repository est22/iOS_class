//
//  DetailViewController.swift
//  BTSApp
//
//  Created by Lia An on 9/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    var member:[String:String]?
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var lblNick: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let member else {
//            lblNick.text = member["stage_name"]
//            let imageName = member["image"]{
//                imageProfile.image = UIImage(named: imageName)
//        }
        lblNick.text = member?["stage_name"]
        if let imageName = member?["image"]{
            imageProfile.image = UIImage(named: imageName)
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
//    }
    

}
