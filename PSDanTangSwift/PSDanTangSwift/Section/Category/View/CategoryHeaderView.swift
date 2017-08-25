//
//  CategoryHeaderView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

protocol CategoryHeaderViewDelegate {
    
    func didClickLookAllButton()
}

class CategoryHeaderView: UICollectionReusableView {

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var delegate: CategoryHeaderViewDelegate?

    // "查看全部"被点击
    @IBAction func lookAllButtonClick(_ sender: AnyObject) {
        
        if delegate != nil {
            delegate?.didClickLookAllButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}
