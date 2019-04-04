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

class MessageViewController: UIViewController {
    
    let webView: WKWebView = WKWebView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setContoller()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.alpha = 1.0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisappear")
        if((self.navigationController?.navigationBar.isHidden)!){
            
        }
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Method
    private func setContoller() {
        //네비게이션 설정
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "JOYFUL"
        self.navigationController?.navigationBar.tintColor = .white
        //탭바 설정
        self.tabBarController?.tabBar.tintColor = .white
        self.tabBarItem.image = UIImage(named: "More")
        self.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        self.tabBarController?.delegate = self
        //웹뷰 설정
        webView.navigationDelegate = self
        webView.uiDelegate = self
        let request = URLRequest(url: URL(string: "https://www.youtube.com/user/jointhebibleproject/videos")!)
        webView.load(request)
    }

}

extension MessageViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if(viewController != self.tabBarController?.viewControllers![0]){
            self.navigationController?.navigationBar.isHidden = false
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
    }
}

extension MessageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (html, error) in
            print(html)
        }
    }
}

extension MessageViewController: WKUIDelegate {
    
}
