//
//  TopicViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/5.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SDCycleScrollView

class TopicViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource,AllThemeDetailCellDelegate {

    var tableView: UITableView?
    // 数据原数组
    var dataArray = [HomeListModel]()
    let cellId = "SettingCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        createTableView()
        createScrollView()
    }
    
    func loadData() {
        
        NetWorkTool.shareNetWorkTool.loadHomeInfo(id: 4) { (homeModelList) in
            
            self.dataArray += homeModelList
        }
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllThemeDetailCell", for: indexPath) as! AllThemeDetailCell
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    // 头视图的高度
  
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 42
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170
    }
    
    
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
       let headerView = (Bundle.main.loadNibNamed("HomeHeaderView", owner: self, options: nil) as! NSArray).lastObject
        return headerView as! HomeHeaderView?
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeDetailVc = HomeDatailViewController()
        navigationController?.pushViewController(homeDetailVc, animated: true)
    }

    
    func didLikeButtonClick() {
        
        print("喜欢")
    }
    
}

// MARK: - 设置界面
extension TopicViewController {
    
    func createTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
        self.automaticallyAdjustsScrollViewInsets = false
        // 注册cell
        tableView?.register(UINib.init(nibName: "AllThemeDetailCell", bundle: nil), forCellReuseIdentifier: "AllThemeDetailCell")
        tableView?.register(UINib.init(nibName: "HomeHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeHeaderView")
    }
    
    func createScrollView() {
        
        let sdCycleView = SDCycleScrollView()
        sdCycleView.frame = CGRect(x: 0, y: 44, width: SCREENW, height: 200)
        sdCycleView.backgroundColor = UIColor.red
        tableView?.tableHeaderView = sdCycleView
    }
}

