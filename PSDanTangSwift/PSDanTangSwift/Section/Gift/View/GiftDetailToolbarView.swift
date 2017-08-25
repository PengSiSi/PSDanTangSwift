//
//  GiftDetailToolbarView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

protocol GiftDetailToolbarViewDelegate {
    
    func didClickLikeButton()
    func didClickGoTianMaoBuy()
    
}

class GiftDetailToolbarView: UIView {

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var delegate: GiftDetailToolbarViewDelegate?
    
    // 去天猫购买
    @IBAction func goTianMaoBuyButton(_ sender: AnyObject) {
        if self.delegate != nil {
            delegate?.didClickGoTianMaoBuy()
        }
    }

    // 喜欢
    @IBAction func likeButton(_ sender: AnyObject) {
        if self.delegate != nil {
            delegate?.didClickLikeButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.cornerRadius = 5
        likeButton.layer.borderColor = UIColor.red.cgColor
        likeButton.layer.borderWidth = 0.5
        buyButton.layer.cornerRadius = 5
    }
}
