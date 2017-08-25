//
//  ChannelModel.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ChannelModel: NSObject {

    /*
     {
     "editable": true,
     "id": 14,
     "name": "美食"
     },
     */
    
    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        editable = dict["editable"] as? Bool
        id = dict["id"] as? Int
        name = dict["name"] as? String
    }
}
