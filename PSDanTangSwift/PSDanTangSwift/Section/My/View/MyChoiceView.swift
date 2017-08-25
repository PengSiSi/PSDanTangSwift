//
//  MyChoiceView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/3.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class MyChoiceView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        // 添加子控件
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(indicatorView)
        
        // 布局子视图
        layout()
    }
    
    func layout() {
      
        leftButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightButton)
        }
        rightButton.snp.makeConstraints { (make) in
            make.left.equalTo(leftButton.snp.right)
            make.top.right.bottom.equalTo(self)
        }
        indicatorView.snp.makeConstraints { (make) in
            make.height.equalTo(2)
            make.bottom.left.equalTo(self)
            make.right.equalTo(leftButton)
        }
    }
    
    // 左边按钮
    fileprivate lazy var leftButton: UIButton = {
       
        let leftButton = UIButton()
        leftButton.setTitle("喜欢的商品", for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftButton.setTitleColor(UIColor.gray, for: .normal)
        leftButton.backgroundColor = UIColor.white
        leftButton.addTarget(self, action: #selector(leftButtonClick(button:)), for: .touchUpInside)
        leftButton.layer.borderColor = UIColor.lightGray.cgColor
        leftButton.layer.borderWidth = 0.5
        leftButton.isSelected = true
        return leftButton
    }()
    
    // 右边按钮
    fileprivate lazy var rightButton: UIButton = {
        
        let rightButton = UIButton()
        rightButton.setTitle("喜欢的专题", for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.setTitleColor(UIColor.gray, for: .normal)
        rightButton.backgroundColor = UIColor.white
        rightButton.addTarget(self, action: #selector(rightButtonClick(button:)), for: .touchUpInside)
        rightButton.layer.borderColor = UIColor.lightGray.cgColor
        rightButton.layer.borderWidth = 0.5
        rightButton.isSelected = true
        return rightButton
    }()
    
    // 红色视图
    fileprivate lazy var indicatorView: UIView = {
       
        let indicatorView = UIView()
        indicatorView.backgroundColor = GlobalRedColor()
        return indicatorView
    }()
    
    // 左边按钮被点击
    func leftButtonClick(button: UIButton) {
        
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: 0.3) {
            // block中记得要self
            self.indicatorView.frame.origin.x = 0
        }
    }
    
    // 右边按钮被点击
    func rightButtonClick(button: UIButton) {
        
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: 0.3) {
            // block中记得要self
            self.indicatorView.frame.origin.x = SCREENW * 0.5
        }
    }
}
