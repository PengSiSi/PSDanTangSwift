//
//  GiftCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SDWebImage

class GiftCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    var model: GiftModel? {
        
        didSet {
            
            imgView.sd_setImage(with: URL(string: (model?.cover_image_url)!))
            nameLabel.text = model?.name
            priceLabel.text = model?.price
            
            // 不这么写将会是option类型
            if let likeTitlt = model?.favorites_count {
                likeButton.setTitle(String(describing: likeTitlt), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
