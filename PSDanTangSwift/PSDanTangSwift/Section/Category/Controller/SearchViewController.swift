//
//  SearchViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

let searchCollectionCellID = "searchCollectionCellID"

class SearchViewController: BaseViewController,UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegateFlowLayout, SortTableViewDelegate {

    weak var collectionView: UICollectionView?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNav()
//        setCollectionView()
        view.addSubview(searchView)
    }
    
    func setNav() {
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", target: self, action: #selector(cancleClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", fontSize: 15, target: self, action: #selector(cancleClick))
        navigationItem.titleView = searchBar
    }
    
    func cancleClick() {
        
        print("取消")
        _ =  navigationController?.popViewController(animated: true)
    }
    
    fileprivate lazy var searchBar: UISearchBar = {
       
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索商品、专题"
        searchBar.delegate = self
        return searchBar
    }()
    
    fileprivate lazy var searchView: SearchRecordView = {
        
        let searchView = SearchRecordView()
        searchView.backgroundColor = UIColor.white
        searchView.frame = CGRect(x: 0, y: 64, width: SCREENW, height: SCREENH - 64)
        return searchView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "giftCellId", for: indexPath) as! GiftCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("进入商品详情")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (SCREENW - 20) / 2
        let height: CGFloat = 245
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.zero
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("开始搜索")
        searchBar.resignFirstResponder()
        // 改变导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_sort_21x21_"), style: .plain, target: self, action: #selector(sortButtonClick))
        
        // 取得搜索结果
        
        // 刷新collectionView
        collectionView?.reloadData()
    }
    
    // 结束编辑,展示collectionView
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        setCollectionView()
        return true
    }
    
    // 返回
    func navigationBackClick() {
       
        _ =  navigationController?.popViewController(animated: true)
    }
    
    // 排序
    func sortButtonClick() {
      
        print("排序")
        popView.show()
    }
    
    // 懒加载
    fileprivate lazy var popView: SortTableView = {
       
        let popView = SortTableView()
        popView.delegate = self
        return popView
    }()
    
    func didSelectSortView(sortView: SortTableView, selectRowIndexPathString: String) {
        print("选中了\(selectRowIndexPathString)")
        popView.dismiss()
    }
}

extension SearchViewController {
    
    func setCollectionView() {
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView.backgroundColor = view.backgroundColor
        view.addSubview(collectionView)
        // 注册cell
        collectionView.register(UINib.init(nibName: "GiftCell", bundle: nil), forCellWithReuseIdentifier: "giftCellId")
        self.collectionView = collectionView
    }
}
