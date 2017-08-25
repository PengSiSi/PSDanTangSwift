//
//  MainViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}


//MARK: 设置子控制器
extension MainViewController{
    
    /// 设置所有子控制器
    func setupChildControllers() {
        
        // TabBar_category_23x23_     TabBar_category_23x23_selected
        let array = [
            ["clsName": "HomeViewController","title": "首页","imageName": "home"],
            ["clsName": "GiftViewController","title": "单品","imageName": "category"],
            ["clsName": "CategoryViewController","title": "分类","imageName": "gift"],
            ["clsName": "MyViewController","title": "我的","imageName": "me_girl"],
            ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict as [String : AnyObject]))
        }
        viewControllers = arrayM
    }
    
    // 使用字典创建一个子控制器
    private func controller(dict: [String : AnyObject]) ->UIViewController {
        
        // 1. 取得字典内容 <守护>
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else{
                return UIViewController()
        }
        // 2. 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        // 3. 设置图像
        vc.tabBarItem.image = UIImage(named: "TabBar_" + imageName + "_23x23_")
        vc.tabBarItem.selectedImage = UIImage(named: "TabBar_" + imageName + "_23x23_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 4. 设置 tabbar 的标题字体（大小）
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.red],
            for: .highlighted)
        // 系统默认是 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName: UIFont.systemFont(ofSize: 12)],
            for: UIControlState(rawValue: 0))
        
        // 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = BaseNavigationController(rootViewController: vc)
        return nav
    }
}
