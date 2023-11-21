//
//  AuthorizationWKWebView.swift
//  vk
//
//  Created by nastasya on 07.11.2023.
//

import UIKit
import WebKit

final class AuthorizationWKWebView: UIViewController {

    private var webView:  WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51787975&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&response_type=token")
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
        webView.overrideUserInterfaceStyle = .dark
    }
}

extension AuthorizationWKWebView: WKUIDelegate {
    
}

extension AuthorizationWKWebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment.components(separatedBy: "&").map { $0.components(separatedBy: "=") } .reduce([String: String]()) { result, param in
            var dict = result
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }
        let token = params["access_token"]
        let userID = params["user_id"]
        Session.instance.token = token!
        Session.instance.userID = Int(userID!) ?? 0
        print(token)
        print(userID)
        decisionHandler(.cancel)
        let tabBar = TabBarBuilder.createTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
}
