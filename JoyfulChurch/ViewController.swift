//
//  ViewController.swift
//  JoyfulChurch
//
//  Created by SIMA on 16/02/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .black
        lb.text = "이연희 안경 뭐임."
        lb.font = UIFont(name: "system", size: 15)
        lb.textColor = .white
        lb.textAlignment = .center
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        self.view.addSubview(label)
        
    }


}

