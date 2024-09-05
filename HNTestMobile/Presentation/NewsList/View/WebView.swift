//
//  WebView.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: String?

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = url, let url = URL(string: urlString) {
                  let request = URLRequest(url: url)
                  uiView.load(request)
              }
    }
}
