//
//  EditViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

// 定义闭包传递输入的昵称

typealias finishButtonClick = (_ inputString: String ) -> ()

class EditViewController: BaseViewController {

    let inputTF = UITextField()
    var nickNameBlock: finishButtonClick?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "编辑资料"
        setNav()
        createUI()
    }
}

extension EditViewController {
    
    func setNav() {
        let leftItem = UIBarButtonItem.init(title: "取消", target: self, action: #selector(cancleClick))
        let rightItem = UIBarButtonItem.init(title: "完成", target: self, action: #selector(finishClick))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func cancleClick() {
       
       _ =  navigationController?.popViewController(animated: true)
    }
    
    func finishClick() {
        
        if inputTF.text != nil {
            if self.nickNameBlock != nil {
                self.nickNameBlock!(inputTF.text!)
            }
        }
       _ =  navigationController?.popViewController(animated: true)

    }
}

extension EditViewController {
    
    func createUI() {
        
        let imgView = UIImageView(image: UIImage(named: "Me_AvatarPlaceholder_75x75_"))
        view.addSubview(imgView)
        imgView.frame = CGRect(x: (SCREENW - 75) / 2, y: 84, width: 75, height: 75)
        let inputView = UIView()
        inputView.frame = CGRect(x: 0, y: imgView.bottom + 10, width: SCREENW, height: 44)
        inputView.backgroundColor = UIColor.white
        view.addSubview(inputView)
        let nickLabel = UILabel()
        nickLabel.frame = CGRect(x: 10, y: 0, width: 50, height: 44)
        inputView.addSubview(nickLabel)
        nickLabel.text = "昵称"
        nickLabel.textColor = UIColor.lightGray
        
        inputTF.frame = CGRect(x: nickLabel.right + 10, y: 0, width: SCREENW - 70, height: 44)
        inputTF.clearButtonMode = .always
        inputView.addSubview(inputTF)
    }
}
