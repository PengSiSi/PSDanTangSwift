//
//  SortTableView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/5.
//  Copyright © 2016年 思 彭. All rights reserved.
// 点击排序按钮，弹出的排序列表

import UIKit

let sortTableViewCellId = "sortTableViewCellId"

protocol SortTableViewDelegate {
    
    func didSelectSortView(sortView: SortTableView, selectRowIndexPathString: String)
}

class SortTableView: UIView {

    var delegate: SortTableViewDelegate?
    let cells = ["默认排序", "按热度排序", "价格从低到高", "价格从高到低"]
    /// 排序方式
    let sorts = ["", "hot", "price%3Aasc", "price%3Adesc"]
    func show() {
        let window = UIApplication.shared.keyWindow
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.clear
        window?.addSubview(self)
    }
    
    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        self.removeFromSuperview()
    }
    
   override init(frame: CGRect) {
    
    super.init(frame: frame)
    addSubview(bgView)
    bgView.addSubview(tableView)
    bgView.snp.makeConstraints { (make) in
        make.top.equalTo(self).offset(60)
        make.right.equalTo(self)
        make.size.equalTo(CGSize(width: 140, height: 150))
    }
    tableView.snp.makeConstraints { (make) in
        make.edges.equalTo(bgView)
    }
}
    
    func dismiss() {
        
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // 懒加载
    fileprivate lazy var bgView: UIImageView = {
       
        let bgView = UIImageView()
        bgView.isUserInteractionEnabled = true
        bgView.image = UIImage(named: "bg_menu_sort_140x46_")
        return bgView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 35
        tableView.isScrollEnabled =  false
        tableView.separatorStyle = .none
        
        // 注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
}

extension SortTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = cells[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let string = cells[indexPath.row]
        if delegate != nil {
            delegate?.didSelectSortView(sortView: self, selectRowIndexPathString: string)
        }
    }
    
}
