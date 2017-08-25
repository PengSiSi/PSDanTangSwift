//
//  SelectIdentifyCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SelectIdentifyCell: UITableViewCell {
    
    var name: String?
    let imgView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectIdentifyCell {
    
    func createSubViews() {
        
        self.contentView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
            make.width.height.equalTo(20)
        }
        // 这里没有找到"对勾"按钮,就用一个💕代替啦!
        imgView.image = UIImage(named: "content-details_like_selected_16x16_")
        imgView.isHidden = true
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).offset(20)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(SCREENW - 60)
        }
        titleLabel.text = "sisi"
    }
}
