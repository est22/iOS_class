//
//  ViewController.swift
//  WebNativeCom
//
//  Created by Lia An on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userContent = WKUserContentController()
        userContent.add(self, name: "SendMessage")
        userContent.add(self, name: "SayHello")
        userContent.add(self, name: "SetUser")
 
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.userContentController = userContent
        
        let frame = CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width, height: view.frame.height/3*2))
        
        webView = WKWebView(frame: frame, configuration: webViewConfig)
        //
        view.addSubview(webView!)
        
        // request 생성
        guard let url = URL(string: "http://127.0.0.1:8080") else { return }
        let request = URLRequest(url: url)
        webView?.load(request)
        
        
        // alert창을 위한 VC(아래 extension) Delegate
        webView?.uiDelegate = self
        
        
        
    }

    // Add Buttons

    @IBAction func action1(_ sender: Any) {
        webView?.evaluateJavaScript("call_func1()")
    }
    @IBAction func action2(_ sender: Any) {
        let name = "aespa"
        webView?.evaluateJavaScript("call_func2('\(name)')")
    }
    @IBAction func action3(_ sender: Any) {
        let info = ["phone": "010-1111-1111", "email": "a@a.com","name": "홍길동", "gender": "male"]
        
        do {
            // data 정렬화
            let infoData: Data = try JSONSerialization.data(withJSONObject: info)
            // data 인코딩
            guard let encodedData = String(data: infoData, encoding: .utf8) else { return }
            // JS function과 통신
            webView?.evaluateJavaScript("call_func3('\(encodedData)')",
            completionHandler: {result, error in
            if let error { return }
            guard let info = result as? [String:String] else {return}
            print(info)
            })
            } catch {
                print("error occured")
        }
        
    }
    
    
}
extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "SendMessage":
            print("SendMessage")
            print(message.body)
            
        case "SayHello":
            print("SayHello")
            print(message.body)
            
        case "SetUser":
            print("SetUser")
            print(message.body)
            if let info = message.body as? [String:String] {
                print(info["name"]!, info["email"]!, info["gender"]!)
            }
        default:
            print("정의되지 않은 메시지")
        }
        
    }
}

extension ViewController: WKUIDelegate {
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // (Bool) 이니까 action 두개
        // true
        let actionTrue = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler(true)
        }
        alert.addAction(actionTrue)
        
        // false
        let actionFalse = UIAlertAction(title: "취소", style: .cancel) { _ in
            completionHandler(false)
        }
        alert.addAction(actionFalse)
        
        
        present(alert, animated: true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: nil, message: prompt, preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.placeholder = defaultText
        }
        
        let action = UIAlertAction(title: "입력하세요", style: .default) { _ in
            // FIXME: - 기분이 안좋음. text1 -> textField로 고침.
            
            if let textField = alert.textFields?[0] {
                let text = textField.text ==  "" ? defaultText : textField.text
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
}
