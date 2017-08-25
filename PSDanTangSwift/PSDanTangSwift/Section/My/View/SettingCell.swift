//
//  SettingCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var indicatorImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    // 设置数据显示
    var settingModel: SettingModel? {
        
        didSet {
        
            iconImageView.image = UIImage(named: (settingModel?.iconImage)!)
            leftLabel.text = settingModel?.leftTitle
            rightLabel.text = settingModel?.rightTitle
            indicatorImgView.isHidden = (settingModel?.isHiddenRightTip!)!
            switchOn.isHidden = (settingModel?.isHiddenSwitch)!
        }
    }
}
