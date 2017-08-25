//
//  CategoryViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

let cellId = "CollectionCellID"

class CategoryViewController: BaseViewController {

    var collectionView: UICollectionView?
    var dataArray: [AnyObject] = []
    var dataArray1: [AnyObject] = []
    var dataArray2: [AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupCollectionView()
        loadData()
    }
}

extension CategoryViewController {
    
    func loadData() {
        
        NetWorkTool.shareNetWorkTool.loadCategoryListData { (array) in
            
            self.dataArray = array;
            for i in 0...self.dataArray.count - 1 {
                if i < 4 {
                    self.dataArray1.append(self.dataArray[i])
                }
//                else {
//                    self.dataArray2.append(self.dataArray[i])
//                }
            }
            self.collectionView?.reloadData()
        }
    }
}

extension CategoryViewController {
    
    func setupNav() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(searchClick))
    }
    
    func searchClick() {
        
        print("搜索")
        let searchVc = SearchViewController()
        self.navigationController?.pushViewController(searchVc, animated: true)
    }
}

extension CategoryViewController {
    
    func setupCollectionView() {

        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        view.addSubview((collectionView!))
        collectionView?.backgroundColor = UIColor.white
        //水平滑动
        
        // 注册cell
        collectionView?.register(UINib.init(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView?.register(UINib.init(nibName: "TopCell", bundle: nil), forCellWithReuseIdentifier: "TopCell")
        collectionView?.register(UINib.init(nibName: "CategoryHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryHeaderView")
        collectionView?.register(UINib.init(nibName: "CategoryFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CategoryFooterView")
    }
}

// 数据源,代理
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout, CategoryHeaderViewDelegate {

    // MARK: - UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else if section == 1 {
            
            return self.dataArray1.count
        }
        else {
            return self.dataArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
            return cell
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            cell.model = self.dataArray1[indexPath.row] as? CategoryModel;
            return cell
  
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            cell.model = self.dataArray[indexPath.row] as? CategoryModel;
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let detailVc = CategoryDetailVC()
            detailVc.title = self.dataArray1[indexPath.row].name;
            self.navigationController?.pushViewController(detailVc, animated: true)
        }
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        
//        return 10
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headView: CategoryHeaderView
        
        if kind == UICollectionElementKindSectionHeader {
            
            headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryHeaderView", for: indexPath) as! CategoryHeaderView
            headView.delegate = self
            if indexPath.section == 1 {
                headView.titleLabel.text = "风格"
                headView.detailLabel.isHidden = true
                headView.goButton.isHidden = true
            }
            else if indexPath.section == 2 {
                headView.titleLabel.text = "品类"
                headView.detailLabel.isHidden = true
                headView.goButton.isHidden = true
            }
            return headView
        }
        else{

            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CategoryFooterView", for: indexPath)
            return footerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: SCREENW, height: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 2 {
            return CGSize.zero
        }
        return CGSize(width: SCREENW, height: 10)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            return CGSize(width: (SCREENW - 40) / 3, height: 60)

        }
        else {
            
            let width: CGFloat = (SCREENW - 80) / 4
            let height: CGFloat = 130
            return CGSize(width: width, height: height)
        }
    }
    
    // MARK: - CategoryHeaderViewDelegate
    func didClickLookAllButton() {
     
        print("查看全部")
        let allThemeVc = AllThemeViewController()
        navigationController?.pushViewController(allThemeVc, animated: true)
    }
}
