//
//  MyViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, MyHeaderViewDelegate ,UIActionSheetDelegate{

    var cellCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 隐藏导航栏
        navigationController?.navigationBar.isHidden = true
//        view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    // 头视图
    fileprivate lazy var headerView: MyHeaderView = {
        
        let headerView = MyHeaderView()
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: 200)
        headerView.backgroundColor = UIColor.groupTableViewBackground
        return headerView
    }()
    
    // 尾视图
    fileprivate lazy var footerView: MyFooterView = {
        
        let footerView = MyFooterView()
        footerView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: 200)
        return footerView
    }()
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let choiceView = MyChoiceView()
        return choiceView
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

// 设置界面

extension MyViewController {
    
    func setupTableView() {
        
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    // MARK: - MyHeaderViewDelegate
    
    func didClickAvaterButton() {
        
        print("头像被点击啦")
//        // 判断是否登录
//        if UserDefaults.standard.bool(forKey: "isLog") {
//            
            let actionSheet: UIAlertController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
            // 相机
            let cameraAction = UIAlertAction(title: "编辑资料", style: .default, handler: { (actionSheet) in
                
                let editVc = EditViewController()
                
                // 执行闭包
                editVc.nickNameBlock = { (str: String) -> () in

                    self.headerView.nickNameLabel.text = str
                }
                self.navigationController?.pushViewController(editVc, animated: true)
            })
            // 相册
            let photoAction = UIAlertAction(title: "退出登录", style: .default, handler: { (_) in
                UserDefaults.standard.set(false, forKey: "isLog")
            })
            // 取消
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            // 添加
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoAction)
            self.present(actionSheet, animated: true, completion: nil)
        }
//        else {
//          
//            let logginVc = LogViewController()
//            logginVc.title = "登录"
//            let nav = BaseNavigationController(rootViewController: logginVc)
//            present(nav, animated: true, completion: nil)
//        }
//    }
    
    func didClickMessageButton() {
        
        let messageVc = MessageViewController()
        messageVc.title = "消息"
        self.navigationController?.pushViewController(messageVc, animated: true)
    }
    
    func didClickSettingButton() {
        
        let settingVc = SettingViewController()
        self.navigationController?.pushViewController(settingVc, animated: true)
    }
}

  
