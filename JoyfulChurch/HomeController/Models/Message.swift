//
//  Message.swift
//  JoyfulChurch
//
//  Created by SIMA on 11/04/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import Foundation

struct Message {
    var title: String?
    var date: Date?
    var speaker: String?
    var bible: String?
    
    init(dic: [String: Any]) {
        guard let title = dic["title"] as? String else { return }
        self.title = title
        guard let date = dic["date"] as? Date else { return }
        self.date = date
        guard let speaker = dic["speaker"] as? String else { return }
        self.speaker = speaker
        guard let bible = dic["bible"] as? String else { return }
        self.bible = bible
    }
}
