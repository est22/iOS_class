//
//  WebViewController.swift
//  BookFinderWithAF
//
//  Created by Lia An on 10/28/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var strURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let strURL, let url = URL(string: strURL) else {return}
        
        let request = URLRequest(url: url)
        webView.load(request)


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
