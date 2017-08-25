//
//  AboutViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {

    var imgView: UIImageView?
    var titlelabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "关于"
        createUI()
    }
    
    func createUI() {
        imgView = UIImageView(frame: CGRect(x: (SCREENW - 80) / 2, y: 100, width: 80, height: 80))
        imgView?.backgroundColor = UIColor.red
        imgView?.image = UIImage(named: "AppIcon")
        view.addSubview(imgView!)
        titlelabel = UILabel(frame: CGRect(x: (SCREENW - 100) / 2, y: 230, width: 100, height: 30))
        titlelabel?.font = UIFont.systemFont(ofSize: 15)
        titlelabel?.text = "Version: 1.0"
        titlelabel?.textColor = UIColor.gray
        view.addSubview(titlelabel!)
    }
}
