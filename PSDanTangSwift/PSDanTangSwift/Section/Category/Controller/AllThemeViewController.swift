//
//  AllThemeViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class AllThemeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate{

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "全部主题"
        createTableView()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllThemeCell", for: indexPath) as! AllThemeCell
        cell.selectionStyle = .none
        return cell
    }
    
    // 头视图的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVc = AllThemeDetailVc()
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

// MARK: - 设置界面
extension AllThemeViewController {
    
    func createTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
        // 注册cell
        tableView?.register(UINib.init(nibName: "AllThemeCell", bundle: nil), forCellReuseIdentifier: "AllThemeCell")
    }
}
