//
//  EventCell.swift
//  JoyfulChurch
//
//  Created by SIMA on 10/04/2019.
//  Copyright © 2019 JoyfulChurch. All rights reserved.
//


import UIKit
import SnapKit
import RxSwift
import RxCocoa

class EventCell: UITableViewCell {

    let titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "뭐지?"
        return titleLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    private func setView() {
        self.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self)
            make.height.equalTo(50)
            make.width.equalTo(self)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
