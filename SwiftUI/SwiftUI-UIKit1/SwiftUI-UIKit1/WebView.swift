//
//  WebView.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var strURL: String
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: strURL) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


#Preview {
    WebView(strURL: "https://www.apple.com")
}