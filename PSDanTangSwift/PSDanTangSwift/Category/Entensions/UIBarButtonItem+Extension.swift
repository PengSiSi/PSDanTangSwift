//
//  UIBarButtonItem+Extension.swift
//  WeiBoSwift
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit


// MARK: - UIBarButtonItem

extension UIBarButtonItem{
    
    // 遍历构造函数
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject? , action: Selector) {
       
        // 设置按钮
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.setTitleColor(UIColor.white, for: .normal)
        self.init(customView: btn)
    }
}
