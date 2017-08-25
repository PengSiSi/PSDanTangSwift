//
//  SelectIdentifyViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

protocol SelectIdentifyDelegate {
    
    func didSelectedMyIdentify(_selectedIdentify: String?);
}

class SelectIdentifyViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView?
    var dataArray: [String]?
    var identify: Bool?   // 0:性别   1: 角色
    var delegate: SelectIdentifyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "选择角色"
        initData()
        createTableView()

    }
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray!.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectIdentifyCell", for: indexPath) as! SelectIdentifyCell
        cell.titleLabel.text = dataArray?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SelectIdentifyCell
        cell.imgView.isHidden = false
        if delegate != nil {
            delegate?.didSelectedMyIdentify(_selectedIdentify: dataArray?[indexPath.row])
        }
       _ =  self.navigationController?.popViewController(animated: true)
    }
}

extension SelectIdentifyViewController {
    
    func createTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
        // 注册cell
        tableView?.register(SelectIdentifyCell.self, forCellReuseIdentifier: "SelectIdentifyCell")
    }
    
    func initData() {
        
        // 角色
        if identify == true {
            
            dataArray = ["初中生", "高中生", "大学生", "职场新人", "资深工作党"]
        }
        else{
        // 性别
            dataArray = ["男生", "女生"]
        }
    }
}
