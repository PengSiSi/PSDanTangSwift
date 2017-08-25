//
//  SearchTopCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/5.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SearchTopCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        
        didSet {
            titleLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.layer.cornerRadius = 2
        titleLabel.layer.borderColor = UIColor.lightGray.cgColor
        titleLabel.layer.borderWidth = 0.5
    }

}
