//
//  FirebaseManager.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 14/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//

import Firebase
import SwiftyJSON

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let reference = Database.database().reference()
    let storage = Storage.storage().reference()
    
    func readMainImages(completion: @escaping (JSON?)-> Void) {
        var result: JSON?
        reference.child("main").observeSingleEvent(of: .value) { (snapShot) in
            guard let value = snapShot.value else { return }
            result = JSON(value)
            completion(result)
        }
    }
}
