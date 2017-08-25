//
//  GiftViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

let collectionCellId = "giftCellId"

class GiftViewController: BaseViewController {
    
    // collectionView
    var collectionView: UICollectionView?
    var dataArray = [GiftModel]()
    
    // 数据源
//    var dataArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        loadData()
        
    }
}
// 加载数据

extension GiftViewController {
    
    func loadData() {
        
        NetWorkTool.shareNetWorkTool.loadGiftListData { (array) in
            print(array.count)
            self.dataArray += array
            self.collectionView?.reloadData()
        }
    }
}

// 设置界面
extension GiftViewController {
    
    func setupCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview((collectionView!))
        collectionView?.backgroundColor = view.backgroundColor
        // 注册cell
        collectionView?.register(UINib.init(nibName: "GiftCell", bundle: nil), forCellWithReuseIdentifier: collectionCellId)
    }
}

// 数据源,代理
extension GiftViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath) as! GiftCell
        cell.model = self.dataArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 进入详情
        let detail = GiftDetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (SCREENW - 20) / 2
        let height: CGFloat = 245
        return CGSize(width: width, height: height)
    }
    
    // MARK: - YMCollectionViewCellDelegate
    func collectionViewCellDidClickedLikeButton(button: UIButton) {

   }
}
