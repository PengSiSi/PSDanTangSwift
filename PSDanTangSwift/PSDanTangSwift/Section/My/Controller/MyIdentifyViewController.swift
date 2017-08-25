//
//  MyIdentifyViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class MyIdentifyViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource, SelectIdentifyDelegate {

    var tableView:UITableView = UITableView()
    var dataDic: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的身份"
        dataDic = ["性别": "女孩","角色": "职场新人"]
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor.groupTableViewBackground
//        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        // 注册cell
        tableView.register(UINib.init(nibName: "MyIdentifyCell", bundle: nil), forCellReuseIdentifier: "MyIdentifyCell")
        createFooterView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyIdentifyCell", for: indexPath) as! MyIdentifyCell
        if indexPath.row == 0 {
            
            cell.titleLabel.text = "性别"
            cell.contentLabel.text = dataDic?["性别"]
        }
        if indexPath.row == 1 {
            
            cell.titleLabel.text = "角色"
            cell.contentLabel.text = dataDic?["角色"]
        }
          return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let selectVc = SelectIdentifyViewController()
        selectVc.delegate = self
        
        if indexPath.row == 0 {
            
            // 性别
            selectVc.identify = false
        }
        else if indexPath.row == 1 {
           
            // 角色
            selectVc.identify = true
        }
        self.navigationController?.pushViewController(selectVc, animated: true)
    }
    
    func didSelectedMyIdentify(_selectedIdentify: String?) {
        print("选择了\(_selectedIdentify))")
    }
}

// 创建尾视图

extension MyIdentifyViewController {
    
    func createFooterView() {
        
        let bgView = UIView()
        tableView.tableFooterView = bgView
        bgView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: 30)
        let leftLine = UIView()
        bgView.addSubview(leftLine)
        leftLine.backgroundColor = UIColor.gray
        leftLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.left.equalTo(10)
            make.width.equalTo(30)
            make.height.equalTo(0.5)
        }
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "我们将根据您的身份推荐最合适的内容"
        label.textAlignment = .center
        label.textColor = UIColor.gray
        bgView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.left.equalTo(leftLine.snp.right).offset(10)
            make.width.equalTo(SCREENW - 100)
            make.height.equalTo(bgView)
        }
        let rightLine = UIView()
        rightLine.backgroundColor = UIColor.gray
        bgView.addSubview(rightLine)
        rightLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.left.equalTo(label.snp.right).offset(10)
//            make.width.equalTo(50)
            make.right.equalTo(bgView).inset(10)
            make.height.equalTo(0.5)
        }
    }
}
