//
//  likeCell.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/7.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

typealias addButtonClick = () -> ()

class likeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var addButtonClickBlock: addButtonClick?
    
    @IBAction func addButtonClick(_ sender: AnyObject) {
        
        if addButtonClickBlock != nil {
            addButtonClickBlock!()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
