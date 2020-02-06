//
//  BaseNavigationController.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 06/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//
import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: - Overridden: UINavigationController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    // MARK: - Private methods
    
    func setProperties() {
        view.backgroundColor = .white
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.barTintColor = .black
        self.navigationBar.isTranslucent = false
    }
    
}
