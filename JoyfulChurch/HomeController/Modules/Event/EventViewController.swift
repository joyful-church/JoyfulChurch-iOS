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
    var sections: [String] = ["First", "Second", "Third", "Fouth", "Fifth", "Sixth"]
    var rows: [String] = ["1", "2", "3", "4", "5"]
    
    
    
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
        self.tableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "EventCell")
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in

            make.top.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension EventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        
        if(indexPath.section == 0){
            cell.titleLabel.text = rows[indexPath.row]
        }else if(indexPath.section == 1){
            cell.titleLabel.text = rows[indexPath.row]
        }else if(indexPath.section == 2){
            cell.titleLabel.text = rows[indexPath.row]
        }else if(indexPath.section == 3){
            cell.titleLabel.text = rows[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
}

extension EventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
