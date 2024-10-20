//
//  ViewController.swift
//  UIImageView
//
//  Created by Lia An on 8/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnTouched(_ sender: Any) {
        imageView.image = UIImage(systemName: "sun.max.circle.fill") // from SF symbol
        // imageView.image = UIImage(named: "bts5")
    }
    

}

