//
//  CategoryCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    var model : CategoryModel? {
        
        didSet {
           
            self.imgView.sd_setImage(with: URL(string: (model?.icon_url)!))
            self.titlelabel.text = model?.name
        }
    }
}
