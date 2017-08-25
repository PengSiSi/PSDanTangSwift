//
//  CategoryDetailVC.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/22.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class CategoryDetailVC: BaseViewController, UITableViewDelegate, UITableViewDataSource,AllThemeDetailCellDelegate {

    var tableView: UITableView?
    // 数据原数组
    var dataArray = [HomeListModel]()
    let cellId = "SettingCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        createTableView()
    }
    
    func loadData() {
        
        NetWorkTool.shareNetWorkTool.loadCategoryDetailData { (dataArray) in
            self.dataArray = dataArray
            self.tableView?.reloadData()
        }
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllThemeDetailCell", for: indexPath) as! AllThemeDetailCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.model = self.dataArray[indexPath.row];
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeDetailVc = HomeDatailViewController()
        homeDetailVc.model = self.dataArray[indexPath.row];
        navigationController?.pushViewController(homeDetailVc, animated: true)
    }
    
    func didLikeButtonClick() {
        
        print("喜欢")
    }
    
    
    func createTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREENW, height: SCREENH), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
        self.automaticallyAdjustsScrollViewInsets = false
        // 注册cell
        tableView?.register(UINib.init(nibName: "AllThemeDetailCell", bundle: nil), forCellReuseIdentifier: "AllThemeDetailCell")
    }
}
