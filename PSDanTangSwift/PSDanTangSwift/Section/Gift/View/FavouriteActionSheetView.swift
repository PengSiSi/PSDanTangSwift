//
//  FavouriteActionSheetView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/7.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

protocol FavouriteActionSheetViewDelegate {
    
    func didClickAddButton()
}

class FavouriteActionSheetView: UIView, UITableViewDelegate, UITableViewDataSource {

    var delegate: FavouriteActionSheetViewDelegate?
    
    // 类方法,弹出
    
    class func show() {
        
        let actionSheet = FavouriteActionSheetView()
        actionSheet.frame = UIScreen.main.bounds
        actionSheet.backgroundColor = UIColor.white
        let window = UIApplication.shared.keyWindow
        window?.backgroundColor = UIColor.lightGray
        window?.addSubview(actionSheet)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubview(tableView)
    }
    
    lazy var tableView: UITableView = {
       
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: self.height), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "likeCell", bundle: nil), forCellReuseIdentifier: "LIkeCell")
        return tableView
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LIkeCell", for: indexPath) as! likeCell
        if indexPath.row == 0 {
            cell.subTitleLabel.isHidden = true
            cell.titleLabel.text = "新建礼物清单"
        }
        if indexPath.row == 1 {
            
            cell.titleLabel.text = "我喜欢的商品"
            cell.subTitleLabel.text = "0个商品"
            cell.addButton.isHidden = true
        }
        cell.selectionStyle = .none
        cell.addButtonClickBlock = {
            
            print("ADD被点击")
            if self.delegate != nil {
                self.delegate?.didClickAddButton()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "喜欢到专辑"
    }
}
