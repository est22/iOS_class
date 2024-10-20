//
//  ViewController.swift
//  WebViewSample
//
//  Created by Lia An on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var naverBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func naverBtnTouched(_ sender: Any) {
        let url = URL(string: "https://naver.com")
        guard let url else {
            return
        }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    @IBAction func googleBtnTouched(_ sender: Any) {
        let url = URL(string: "https://google.com")
        guard let url else {
            return
        }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    @IBAction func kakaoBtnTouched(_ sender: Any) {
        let url = URL(string: "https://daum.net")
        guard let url else {
            return
        }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}

