//
//  MessageViewController.swift
//  JoyfulChurch
//
//  Created by SIMA on 25/03/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import WebKit
import SnapKit

class MessageViewController: UIViewController {
    
    let webView: WKWebView = WKWebView()
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setContoller()
        contentView.addSubview(webView)
        layout()
    }
    
    //MARK: - Method
    private func setContoller() {
        //네비게이션 설정
        self.navigationController?.navigationBar.topItem?.title = "MESSAGE"
        self.navigationController?.navigationBar.tintColor = .white
        //웹뷰 설정
        webView.navigationDelegate = self
        webView.uiDelegate = self
        let request = URLRequest(url: URL(string: "https://www.youtube.com/user/jointhebibleproject/videos")!)
        webView.load(request)
    }

}

extension MessageViewController {
    private func layout() {
        self.webView.snp.makeConstraints {
            $0.top.equalTo(self.contentView)
            $0.leading.equalTo(self.contentView)
            $0.trailing.equalTo(self.contentView)
            $0.bottom.equalTo(self.contentView)
        }
    }
}

extension MessageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (html, error) in
//            print(html)
        }
        webView.evaluateJavaScript("document.body.textContent") { (html, error) in
//            print(html)
        }
    }
}

extension MessageViewController: WKUIDelegate {
    
}
