//
//  HomeDatailViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/5.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class HomeDatailViewController: BaseViewController, UIWebViewDelegate {

    var webView: UIWebView?
    
    var model: HomeListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "攻略详情"
        
        // 记住webView的创建的时候一定要加载数据,不然webView将显示数据有问题!!!
        self.webView = UIWebView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - 44))
        self.webView?.delegate = self
        let url = URL(string: (model?.content_url)!)
        let request = URLRequest(url: url!)
        self.webView?.loadRequest(request)

        self.view.addSubview(self.webView!)
        
        // 创建底部工具栏
        loadBottomToolView()
    }
}

extension HomeDatailViewController {
    
    func loadBottomToolView() {
    
        var imageArray = ["content-details_like_16x16_","content-details_share_16x16_","content-details_share_16x16_","content-details_share_16x16_"]
        let bottomView = UIView(frame: CGRect(x: 0, y: SCREENH - 44, width: SCREENW, height: 44))
//        bottomView.backgroundColor = UIColor.red
        self.view.addSubview(bottomView)
        
        // 创建三个按钮
        for i in 0..<3 {
            
            let width = SCREENH / 3
            let leftx = CGFloat(i) * width
            let button = UIButton(type: .custom)
            button.x = leftx
            button.width = width
            button.height = 44
            button.y = 0
            button.setImage(UIImage(named: imageArray[i]), for: .normal)
            bottomView.addSubview(button)
        }
    }
}
