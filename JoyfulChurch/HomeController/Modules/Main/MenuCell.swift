//
//  MenuCell.swift
//  JoyfulChurch
//
//  Created by SIMA on 19/03/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getSegueIdentifierFromSelectedRows(indexPath: IndexPath) -> String {
        if(indexPath.row == 0){
            return "EventSegue"
        }else if(indexPath.row == 1){
            return "ConnectSegue"
        }else if(indexPath.row == 2){
            return "PraySegue"
        }else if(indexPath.row == 3){
            return "SocialSegue"
        }else{
            return ""
        }
    }
    
    func setLayout(){
        
    }
    
}
