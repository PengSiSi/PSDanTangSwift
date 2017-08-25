//
//  MyFooterView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/3.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class MyFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
       
       addSubview(meBlankButton)
       addSubview(messageLabel)
       messageLabel.snp.makeConstraints { (make) in
        make.size.equalTo(CGSize(width: 50, height: 50))
        make.center.equalTo(self.center)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meBlankButton.snp.bottom).offset(10)
            make.left.right.equalTo(self)
        }
    }
    
    // 懒加载
    fileprivate lazy var meBlankButton: UIButton = {
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(UIColor.gray, for: .normal)
        meBlankButton.frame = CGRect(x: (SCREENW - 100) / 2, y: 0, width: 100, height: 100)
        meBlankButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        meBlankButton.addTarget(self, action: #selector(footerViewButtonClick), for: .touchUpInside)
        meBlankButton.imageView?.sizeToFit()
        return meBlankButton
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "登录以享受功能"
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.textColor = UIColor.gray
        return messageLabel
    }()
}

// 点击方法
extension MyFooterView {
    
    func footerViewButtonClick() {
        // 跳转至登录页
        let nav = BaseNavigationController(rootViewController: LogViewController())
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
    
}
