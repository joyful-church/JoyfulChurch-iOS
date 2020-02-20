//
//  HomeViewModel.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 05/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//
import Kingfisher

class HomeViewModel {
    
    func getMainBannerImages(completion: @escaping ([URL]) -> Void) {
        FirebaseManager.shared.readMainImages { (json) in
            guard let json = json, let urls = json.array else { return }
            var result = [URL]()
            for url in urls {
                if let url = url.url {
                    result.append(url)
                }
            }
            completion(result)
        }
    }
    
}
