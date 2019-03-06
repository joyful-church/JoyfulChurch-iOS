//
//  MoreViewController.swift
//  JoyfulChurch
//
//  Created by SIMA on 04/03/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setController()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.alpha = 1.0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setController() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "JOYFUL"
        self.navigationController?.navigationBar.tintColor = .white
        self.tabBarController?.tabBar.tintColor = .white
        self.tabBarItem.image = UIImage(named: "More")
        self.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
    }


}
