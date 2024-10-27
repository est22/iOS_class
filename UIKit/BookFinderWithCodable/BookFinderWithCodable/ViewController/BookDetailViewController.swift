//
//  BookDetailViewController.swift
//  BookFinderWithCodable
//
//  Created by Lia An on 10/27/24.
//

import UIKit
import WebKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var strURL: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let strURL, let url = URL(string: strURL)
        else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)

        
    }


}
