//
//  HomeViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UIScrollViewDelegate {

    weak var titlesView = UIView()
    
    // 底部红色指示器
    var indicatorView = UIView()
    
    // 中间滑动视图
    var contentView = UIScrollView()
    
    // 当前选中按钮
    var selectedButton = UIButton()
    
    var dataArray = [ChannelModel]()
    var childControllers = [TopicViewController]()
    var isExpand: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取首页顶部选择数据
        NetWorkTool.shareNetWorkTool.loadHomeTopData { (channelArray) in
            self.dataArray += channelArray
        }
//        //设置顶部标签栏
        setupTitlesView()
        setupNav()
        createBottomScrollView()
    }
}

extension HomeViewController {
    
    // 设置导航栏
    
    func setupNav() {
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(dantangRightBBClick))
    }
    
    func dantangRightBBClick() {
        
        print("搜索")
        let searchVc = SearchViewController()
        self.navigationController?.pushViewController(searchVc, animated: true)
    }
}

extension HomeViewController {
    
    func setupTitlesView() {
        
        // 顶部视图
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: 64, width: SCREENW, height: 44)
        view.addSubview(bgView)
        
        // 标签
        let titlesView = UIView()
        titlesView.backgroundColor = UIColor.white
        titlesView.frame = CGRect(x: 0, y: 0, width: SCREENW - 50, height: 44)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        
        //底部红色指示器
        indicatorView = UIView()
        indicatorView.backgroundColor = GlobalRedColor()
        indicatorView.frame = CGRect(x: 10, y: 44 - 2, width: 30, height: 2)
        indicatorView.tag = -1
        titlesView.addSubview(indicatorView)
        
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRect(x: SCREENW - 40, y: 8, width: 30, height: 30)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick(button:)), for: .touchUpInside)
        bgView.addSubview(arrowButton)
        
        // 内部子标签
        let titlesArray = ["精选", "美物", "美护", "美食", "家居", "数码"]
        let count  = titlesArray.count
        let width = titlesView.frame.size.width / CGFloat(count)
//        let height = 44
        for index in 0..<count {
             let button = UIButton()
            button.frame.origin.x = CGFloat(index) * width
            button.frame.size.width = width
            button.frame.size.height = 44 - 5
            button.frame.origin.y = 0
            button.tag = index
            button.setTitle(titlesArray[index], for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.addTarget(self, action: #selector(titleViewsButtonClick(button:)), for: .touchUpInside)
            titlesView.addSubview(button)
            // 默认是选中第一个标签
            if index == 0 {
                button.isEnabled = true
                selectedButton = button
                //让按钮内部的Label根据文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.frame.size.width = width
                indicatorView.center.x = button.center.x
            }
            
            let topVc = TopicViewController()
            childControllers.append(topVc)
        }
    
    }
    
    func arrowButtonClick(button:  UIButton) {

        button.isSelected = !button.isSelected
        isExpand = button.isSelected
        // 180度转化
        UIView.animate(withDuration: 0.2) {
            button.imageView?.transform = (button.imageView?.transform)!.rotated(by: CGFloat(M_PI))
        }
        let arrowVc = ArrowPresentViewController()
        if button.isSelected == true {
//            
            arrowVc.view.frame = CGRect(x: 0, y: 44 + 64, width: SCREENW, height: SCREENH - 44)
            UIApplication.shared.keyWindow?.addSubview(arrowVc.view)
//            self.view.addSubview(arrowVc.view)
        }
        else {
            arrowVc.view.frame = CGRect.zero

            arrowVc.view.removeFromSuperview()
            arrowVc.view = nil
        }
//        self.modalTransitionStyle = .coverVertical
//        self.navigationController?.present(arrowVc, animated: true, completion: nil)
    }
    
    func titleViewsButtonClick(button: UIButton) {
        
        print("点击的标签")
        selectedButton.isEnabled = true
        button.isEnabled = false
        selectedButton = button
        // 移动红色标签
        UIView.animate(withDuration: 0.1) { 
            self.indicatorView.frame.size.width = (self.selectedButton.titleLabel?.frame.size.width)!
            self.indicatorView.center.x = button.center.x
        }
        // 切换子控制器
        var offset = contentView.contentOffset
        offset.x = CGFloat(button.tag) * contentView.width
        contentView.setContentOffset(offset, animated: false)
    }
}

//底部的scrollview
extension HomeViewController{
    
    func createBottomScrollView() {
        
        contentView.frame = CGRect(x: 0, y: 44, width: SCREENW, height: SCREENH - 44)
        contentView.showsVerticalScrollIndicator = false
//        contentView.showsHorizontalScrollIndicator = false
        contentView.delegate = self
        contentView.contentSize = CGSize(width: SCREENW * 6, height: SCREENH - 64 - 44)
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        // 添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
    }
}

extension HomeViewController {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        //添加子控制器
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        let vc = childControllers[index]
        vc.view.frame.origin.x = scrollView.contentOffset.x / scrollView.frame.size.width
        vc.view.frame.origin.y = 0
        vc.view.frame.size.height = scrollView.frame.size.height
        scrollView.addSubview(vc.view)
        
        let width = (titlesView?.frame.size.width)! / 6.0
        indicatorView.frame.origin.x = width * CGFloat(index)
    }
    
    // 减速移动红色标志视图
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            let button = titlesView!.subviews[index + 1] as! UIButton
            titleViewsButtonClick(button:button)
    }
}
