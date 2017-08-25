//
//  SuggestViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SnapKit

class SuggestViewController: BaseViewController {

    var textView: CustomTextView?
    var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "意见反馈"
        createUI()
    }
}

extension SuggestViewController {
    
    func createUI() {
        
        // "反馈内容"label
        let contentLabel = UILabel(frame: CGRect(x: 20, y: 80, width: SCREENW, height: 20))
        contentLabel.text = "反馈内容"
        contentLabel.font = suggestLabelFont
        contentLabel.textColor = UIColor.gray
        view.addSubview(contentLabel)
        
        // textView
        textView = CustomTextView()
        textView?.placeholderStr = "   我们很需要你的意见和建议~"
        view.addSubview(textView!)
        textView?.snp.makeConstraints({ (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.width.equalTo(view)
            make.height.equalTo(100)
        })
        
        // 联系方式
        let contactLabel = UILabel()
        view.addSubview(contactLabel)
        contactLabel.text = "联系方式"
        contactLabel.font = suggestLabelFont
        contactLabel.textColor = UIColor.gray
        contactLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo((textView?.snp.bottom)!).offset(30)
            make.width.equalTo(view)
            make.height.equalTo(20)
        }
        // 电话
        textField = UITextField()
        view.addSubview(textField!)
        textField?.placeholder = "    电话/邮箱/QQ"
        textField?.backgroundColor = UIColor.white
        textField?.snp.makeConstraints({ (make) in
            make.top.equalTo(contactLabel.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.width.equalTo(view)
            make.height.equalTo(30)
        })
    }
}
