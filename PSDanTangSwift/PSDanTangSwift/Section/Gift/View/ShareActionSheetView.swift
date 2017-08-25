//
//  ShareActionSheetView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ShareActionSheetView: UIView {
    
    // 类方法,弹出
    
    class func show() {
       
        let actionSheet = ShareActionSheetView()
        actionSheet.frame = UIScreen.main.bounds
        actionSheet.backgroundColor = UIColor.white
        let window = UIApplication.shared.keyWindow
        window?.backgroundColor = UIColor.lightGray
        window?.addSubview(actionSheet)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
      
        addSubview(bgView)
        // 上部视图
        bgView.addSubview(topView)
        // 取消按钮
        bgView.addSubview(cancelButton)
        // 分享到
        topView.addSubview(shareLabel)
        // 六个按钮
        topView.addSubview(shareButtonView)
        
        // 布局上部视图
        topView.snp.makeConstraints { (make) in
            make.bottom.equalTo(cancelButton.snp.top).offset(-10)
            make.left.equalTo(cancelButton.snp.left)
            make.right.equalTo(cancelButton.snp.right)
            make.height.equalTo(kTopViewH)
        }
//        topView.backgroundColor = UIColor.lightGray
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(kMargin)
            make.right.bottom.equalTo(bgView).offset(-kMargin)
            make.height.equalTo(44)

        }
        
        shareLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(topView)
            make.height.equalTo(30)

        }
    }
    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        UIView.animate(withDuration: 0.1, animations: { 
            
            self.bgView.y = SCREENH - self.bgView.height
            }, completion: nil)
    }
    
    // 懒加载
    // 底部view
    lazy var bgView: UIView = {
       
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: SCREENH, width: SCREENW, height: 280)
        return bgView
    }()
    
    // 上部view
    lazy var topView: UIView = {
        
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        topView.layer.cornerRadius = kCornerRadius
        topView.layer.masksToBounds = true
        return topView
    }()

    //分享到标签
    fileprivate lazy var shareLabel: UILabel = {
       
        let label = UILabel()
        label.text = "分享到"
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    // 六个按钮
    lazy var shareButtonView: UIView = {
       
        let sharebutton = ShareButtonView()
        sharebutton.frame = CGRect(x: 0, y: 30, width: SCREENW - 20, height: kTopViewH - 30)
        return sharebutton
    }()
    
    lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelButton.setTitleColor(UIColor.gray, for: .normal)
        cancelButton.backgroundColor = UIColor.white
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: .touchUpInside)
        cancelButton.layer.cornerRadius = kCornerRadius
        cancelButton.layer.masksToBounds = true
//        cancelButton.backgroundColor = UIColor.lightGray
        return cancelButton
    }()

    func cancelButtonClick() {
        
        print("取消")
        UIView.animate(withDuration: 0.1, animations: { 
            self.bgView.y = SCREENH
            }) { (_) in
                
                self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.bgView.y = SCREENH
        }) { (_) in
            
            self.removeFromSuperview()
        }
    }
}
