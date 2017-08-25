//
//  LogViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SVProgressHUD

class LogViewController: BaseViewController {

    let passwordTF = UITextField()
    let logButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "登录"
        setNav()
        setTextField()
        createLogButton()
        otherLogin()
        thirdLog()
    }
}

extension LogViewController {
    
    func setNav() {
        let leftItem = UIBarButtonItem.init(title: "取消", target: self, action: #selector(cancleClick))
        let rightItem = UIBarButtonItem.init(title: "注册", target: self, action: #selector(registerClick))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func setTextField() {
        
        // 手机号
        let phoneTF = UITextField()
        view.addSubview(phoneTF)
        phoneTF.backgroundColor = UIColor.white
        phoneTF.frame = CGRect(x: 0, y: 84, width: SCREENW, height: 44)
        phoneTF.placeholder = "   手机号"
        
        // 中间线
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(phoneTF.snp.bottom)
            make.height.equalTo(0.5)
            make.right.equalTo(self.view).offset(-10)
        }
        
        // 密码
        
        view.addSubview(passwordTF)
        passwordTF.backgroundColor = UIColor.white
        passwordTF.placeholder = "   密码"
        passwordTF.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.equalTo(phoneTF)
            make.height.equalTo(phoneTF)
        }
    }
}

extension LogViewController {
    
    func createLogButton() {
        
        
        logButton.setTitle("登录", for: .normal)
        logButton.setTitleColor(UIColor.white, for: .normal)
        logButton.backgroundColor = GlobalRedColor()
        logButton.addTarget(self, action: #selector(logButtonClick), for: .touchUpInside)
        view.addSubview(logButton)
        logButton.layer.cornerRadius = 5
        logButton.layer.masksToBounds = true
        logButton.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(passwordTF.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
    }
}

extension LogViewController {
    
    func otherLogin() {
        
        let leftView = UIView()
        leftView.backgroundColor = UIColor.lightGray
        view.addSubview(leftView)
        let rightView = UIView()
        rightView.backgroundColor = UIColor.lightGray
        view.addSubview(rightView)
        let label = UILabel()
        label.text = "使用社交账号登录"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.top.equalTo(logButton.snp.bottom).offset(28)
            make.left.equalTo(leftView.snp.right).offset(10)
            //            make.width.equalTo(180)
        }
        leftView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.top.equalTo(logButton.snp.bottom).offset(50)
//            make.centerY.equalTo(label)
            make.left.equalTo(logButton)
            make.width.equalTo(80)
        }
        rightView.snp.makeConstraints { (make) in
            make.height.width.equalTo(leftView)
            make.top.equalTo(logButton.snp.bottom).offset(50)
            make.left.equalTo(label.snp.right).offset(10)
            make.top.equalTo(logButton.snp.bottom).offset(50)
//            make.centerY.equalTo(label)
        }
    }
    
    // 三个图标
    func thirdLog() {
        
        let width = 70
        let height = 70
        let margin = 40
        let imgButtonArray = ["Share_WeiboIcon_70x70_","Share_WeChatSessionIcon_70x70_","Share_QQIcon_70x70_"]
        for i in 0...2 {
            let button = UIButton()
            button.frame = CGRect(x: (i * width) + ((i + 1) * margin), y: 380, width: width, height: height)
            view.addSubview(button)
            button.setImage(UIImage(named: imgButtonArray[i]), for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(shareButtonClick(button:)), for: .touchUpInside)
        }
    }
}

extension LogViewController {
    
    func cancleClick() {
       
        self.dismiss(animated: true, completion: nil)
    }
    
    func registerClick() {
        
        let registerVc = RegisterViewController()
        registerVc.title = "注册"
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
    
    func logButtonClick() {
        
        SVProgressHUD.showSuccess(withStatus: "登录成功")
        self.dismiss(animated: true, completion: nil)
    }
    
    func shareButtonClick(button: UIButton) -> Void {
        
        if button.tag == 0 {
            // 微博
            print("微博")
        }
        else if button.tag == 1 {
            // 微信
            print("微信")

        }
        else {
            
            // QQ
            print("QQ")
        }
    }
}
