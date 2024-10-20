//
//  BTSViewController.swift
//  BTSViewer2
//
//  Created by Lia An on 8/30/24.
//

import UIKit

class BTSViewController: UIViewController {
    // Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var cardCount: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var btsImages = ["bts1","bts2","bts3","bts4","bts5","bts6","bts7"]
    var index = 0 { didSet { changeImage() }}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // pageControl
        pageControl.numberOfPages = btsImages.count
        pageControl.currentPage = index

    }
    
    // Button Action
    @IBAction func leftBtnTouched(_ sender: Any) {
        index -= 1
    }
    
    @IBAction func rightBtnTouched(_ sender: Any) {
        index += 1
    }
    
    func changeImage() {
        leftBtn.isEnabled = true
        rightBtn.isEnabled = true
        
        // show index number on label
        cardCount.text =  "\(index + 1)/\(btsImages.count)"
        // pageControl
        pageControl.currentPage = index
        // hit Max condition
        if index == btsImages.count - 1 {
            rightBtn.isEnabled = false
        }
        // hit Min condition
        if index == 0 {
            leftBtn.isEnabled = false
        }
        // show image
        imageView.image = UIImage(named: btsImages[index])
    }
    
    @IBAction func changePage(_ sender: UIPageControl) {
        index = sender.currentPage
        // index = pageControl.currentPage
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
