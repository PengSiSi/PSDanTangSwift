//
//  GiftDetailViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class GiftDetailViewController: BaseViewController, GiftDetailToolbarViewDelegate, FavouriteActionSheetViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.lightGray
        title = "商品详情"
        setNavAndBottom()
        createBottomView()
    }
    
    // 懒加载创建底部视图
    lazy var bottomView: GiftDetailToolbarView = {
        
        let giftDetailBottomView: GiftDetailToolbarView = Bundle.main.loadNibNamed("GiftDetailToolbarView", owner: nil, options: nil)?.last as! GiftDetailToolbarView
        giftDetailBottomView.delegate = self
        return giftDetailBottomView
    }()
    
    lazy var maskView: UIView = {
       
        let maskView = UIView()
        maskView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH)
        maskView.backgroundColor = UIColor.gray
        maskView.alpha = 0.5
        return maskView
    }()
    
    lazy var favoriteView: FavouriteActionSheetView = {
       
        let likeView = FavouriteActionSheetView(frame: CGRect(x: 0, y: SCREENH / 2, width: SCREENW, height: SCREENH / 2))
        //likeView.backgroundColor = UIColor.green
        likeView.delegate = self
        likeView.isUserInteractionEnabled = true
        return likeView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        maskView.removeFromSuperview()
        createBottomView()
    }
}

extension GiftDetailViewController {
    
    func setNavAndBottom() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareClick))
    }
    
    func shareClick() {
       
        ShareActionSheetView.show()
    }
    
    func createBottomView() {
        
       view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view.snp.bottom).offset(-44)
            make.height.equalTo(44)
            make.width.equalTo(SCREENW)
        }
    }
}

extension GiftDetailViewController {
    
    func didClickLikeButton() {
        
        maskView.addSubview(favoriteView)
        view.addSubview(maskView)
        bottomView.removeFromSuperview()
    }
    
    func didClickGoTianMaoBuy() {
        
        let tiMaoVc = GoTianMaoViewController()
        self.navigationController?.pushViewController(tiMaoVc, animated: true)
    }
    
    func didClickAddButton() {
        
        print("Add")
    }
}
