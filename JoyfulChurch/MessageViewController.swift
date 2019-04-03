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

class MessageViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "JOYFUL"
        self.navigationController?.navigationBar.tintColor = .white
        self.tabBarController?.tabBar.tintColor = .white
        self.tabBarItem.image = UIImage(named: "More")
        self.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
    }

}

extension MessageViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if(viewController != self.tabBarController?.viewControllers![0]){
            self.navigationController?.navigationBar.isHidden = false
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
        print(self)
        print("selectedViewcontroller", tabBarController.selectedViewController)
        print("viewcontroller", viewController)
    }
}
