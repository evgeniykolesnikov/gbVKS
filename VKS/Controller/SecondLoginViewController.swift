//
//  SecondLoginViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 05.09.2022.
//

import UIKit
import WebKit

class SecondLoginViewController: UIViewController {

    let session = Session.shared
    var mainVC: UITabBarController?

    @IBOutlet weak var loginWebView: WKWebView!
    let appId = "51416207"


    override func viewDidLoad() {
        super.viewDidLoad()
        loginWebView.navigationDelegate = self
        var urlComponent = URLComponents()

        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"

        urlComponent.queryItems = [
            URLQueryItem(name: "client_id", value: appId),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token")
        ]
        let url = urlComponent.url
        if UIApplication.shared.canOpenURL(url!) {
            let request = URLRequest(url: url!)

            loginWebView.load(request)
        }

    }

}

extension SecondLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }

        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String: String]()) { res, param in

                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"] {
            self.session.token = token
            mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainPage") as?
            UITabBarController
            self.view.insertSubview((mainVC?.view)!, at: 9)
        }
        decisionHandler(.cancel)
    }
}
