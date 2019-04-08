//
//  EventViewController.swift
//  JoyfulChurch
//
//  Created by SIMA on 06/04/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setController()
        
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
        self.navigationController?.navigationBar.isHidden = true
    }

    //MARK: - Method
    private func setController(){
//        self.navigationItem.backBarButtonItem?.title = " "
//        let item = UIBarButtonItem(image: UIImage(named: "NaviBack"), style: .plain, target: self, action: #selector(backButtonAction))
//        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = item
//        self.navigationItem.leftBarButtonItem?.title = ""
        
    }
    
    @objc private func backButtonAction(){
        self.navigationController?.popViewController(animated: true)
    }
        
    
}
