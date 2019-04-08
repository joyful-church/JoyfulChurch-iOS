//
//  EventViewController.swift
//  JoyfulChurch
//
//  Created by SIMA on 06/04/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit
import SnapKit

class EventViewController: UIViewController {

    var tableView = UITableView()
    
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
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in

            make.top.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }   
}
