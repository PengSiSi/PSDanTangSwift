//
//  MyHeaderView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/3.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SnapKit

// 头视图代理
protocol MyHeaderViewDelegate {
    
    func didClickAvaterButton();
    func didClickMessageButton();
    func didClickSettingButton();
}

class MyHeaderView: UIView {

    var delegate: MyHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 创建子视图
    fileprivate func setupUI() {
        
        // 添加子控件
        addSubview(bgImageView)
        addSubview(settingButton)
        addSubview(messageButton)
        addSubview(nickNameLabel)
        addSubview(avatarButton)
        layout()
    }
    
    // 布局子视图
    fileprivate func layout() {
        
        bgImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(-20)
        }
        settingButton.snp.makeConstraints { (make) in
            make.top.equalTo(2)
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.right.equalTo(self)
        }
        messageButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.left.equalTo(self)
            make.top.equalTo(2)
        }
        avatarButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 75, height: 75))
            make.bottom.equalTo(nickNameLabel.snp.top).offset(-10)
        }
        nickNameLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
            make.height.equalTo(20)
        }
    }
    
    // 懒加载子控件
    
    // 1.背景图片
    lazy var bgImageView: UIImageView = {
        
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "Me_ProfileBackground")
        return bgImageView
    }()
    
    // 2.消息按钮
    fileprivate lazy var messageButton: UIButton = {
       
        let messageButton = UIButton(type: .custom)
        messageButton.setImage(UIImage(named: "Me_message_20x20_"), for: .normal)
        messageButton.addTarget(self, action: #selector(messageClick), for: .touchUpInside)
        return messageButton
    }()
    
    // 3.设置按钮
    fileprivate lazy var settingButton: UIButton = {
        
        let settingButton = UIButton()
        settingButton.setImage(UIImage(named: "Me_settings_20x20_"), for: .normal)
        settingButton.addTarget(self, action: #selector(settingClick), for: .touchUpInside)
        return settingButton
    }()
    
    // 4.头像按钮
     lazy var avatarButton: UIButton = {
       
        let avatarButton = UIButton()
        avatarButton.setImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        avatarButton.addTarget(self, action: #selector(avararClick), for: .touchUpInside)
        avatarButton.layer.cornerRadius = avatarButton.frame.size.width * 0.5
        avatarButton.layer.masksToBounds = true
        return avatarButton
    }()
    
    // 5.昵称Label
     lazy var nickNameLabel: UILabel = {
       
        let nickNameLabel = UILabel()
        nickNameLabel.text = "思思"
        nickNameLabel.textColor = UIColor.gray
        nickNameLabel.font = UIFont.systemFont(ofSize: 14)
        nickNameLabel.textAlignment = .center
        return nickNameLabel
    }()
    
    func avararClick() {
        
        if delegate != nil {
            self.delegate?.didClickAvaterButton()
        }
    }
    
    func messageClick() {
        
        if delegate != nil {
            self.delegate?.didClickMessageButton()
        }
    }

    func settingClick() {
        
        if delegate != nil {
            self.delegate?.didClickSettingButton()
        }
    }

}

