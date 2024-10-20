//
//  ViewController.swift
//  BTSViewer
//
//  Created by Lia An on 8/22/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let images = ["bts1","bts2","bts3","bts4","bts5","bts6","bts7"]
    var index = 0;
    


    @IBAction func leftBtn(_ sender: UIButton) {
        index -= 1
        if index<=0 {index=0}
        imageView.image = UIImage(named: images[index])
        
    }
   
    @IBAction func rightBtn(_ sender: UIButton) {
        index += 1
        if index >= 6 {index=6}
        imageView.image = UIImage(named: images[index])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: images[0])
    }
}

