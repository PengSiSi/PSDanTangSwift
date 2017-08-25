//
//  SearchRecordView.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/5.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SearchRecordView: UIView {

    // 关键字
    var keyWord = [String]()
    // collectionView
    var collectionView: UICollectionView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置默认关键字
        keyWord = ["戒指", "音乐", "双肩包","音乐盒", "保湿杯","戒指", "音乐", "双肩包","音乐盒", "保湿杯"]
        
        setupUI()
    }
    
    func setupUI() {
        
        // 大家都在搜
        let topView = UIView()
        addSubview(topView)
        let topLabel = setupLabel(title: "大家都在搜")
        topLabel.frame = CGRect(x: 10, y: 20, width: 200, height: 20)
        topView.addSubview(topLabel)
        
        // 历史纪录
        let bottomView = UIView()
        addSubview(bottomView)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: SCREENW, height: 200), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.addSubview((collectionView!))
        collectionView?.backgroundColor = self.backgroundColor
        // 注册cell
        collectionView?.register(UINib.init(nibName: "SearchTopCell", bundle: nil), forCellWithReuseIdentifier: "SearchTopCell")
    }
    
    func setupLabel(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// 数据源,代理
extension SearchRecordView: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return keyWord.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchTopCell", for: indexPath) as! SearchTopCell
        cell.title = keyWord[indexPath.row]
//        cell.backgroundColor = UIColor.green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = SCREENW / 8.0
        let height: CGFloat = 30
        return CGSize(width: width, height: height)
    }
    
    // MARK: - YMCollectionViewCellDelegate
    func collectionViewCellDidClickedLikeButton(button: UIButton) {
        
    }
}


