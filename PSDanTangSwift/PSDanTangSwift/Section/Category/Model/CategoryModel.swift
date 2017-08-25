//
//  CategoryModel.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/22.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

/*
 "group_id": 2,
 "icon_url": "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150715/v52rr5j3a.png-pw144",
 "id": 13,
 "items_count": 55,
 "name": "美物",
 "order": 0,
 "status": 0
 */


class CategoryModel: NSObject {

    var group_id: Int?
    var icon_url: String?
    var id: Int?
    var items_count: Int?
    var name: String?
    var order: Int?
    var status: Int?
    
    init(dict: [String: AnyObject]) {
        super.init()
        group_id = dict["group_id"] as? Int
        icon_url = dict["icon_url"] as? String
        id = dict["id"] as? Int
        items_count = dict["items_count"] as? Int
        name = dict["name"] as? String
        order = dict["order"] as? Int
        status = dict["status"] as? Int
    }
}
