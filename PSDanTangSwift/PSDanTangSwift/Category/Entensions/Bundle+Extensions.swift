//
//  Bundle+Extensions.swift
//  WeiBoSwift3.0
//
//  Created by 思 彭 on 16/9/17.
//  Copyright © 2016年 思 彭. All rights reserved.
//


import Foundation

extension Bundle {
    
    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
