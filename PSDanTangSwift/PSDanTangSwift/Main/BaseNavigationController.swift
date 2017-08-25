//
//  BaseNavigationController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseNavigationController: UINavigationController {

    // 1.重写 push 方法，隐藏底部的 tabBar
    // 统一设置"返回"按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //        self.navigationBar.isHidden = true
        // 不是栈底需要隐藏
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // 2.设置导航栏标题
   internal override class func initialize() {
    
    let navBar = UINavigationBar.appearance()
    navBar.barTintColor = GlobalRedColor() // 背景
    navBar.tintColor = UIColor.white  // 文字颜色
    navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }
    
    func navigationBackClick() {
        
        // 判断显示
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
}
