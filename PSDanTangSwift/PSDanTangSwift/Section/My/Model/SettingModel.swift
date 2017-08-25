//
//  SettingModel.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import ObjectMapper
/*
class SettingModel: Mappable {

    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        iconImage    <- map["iconImage"]
        leftTitle    <- map["leftTitle"]
        rightTitle   <- map["rightTitle"]
        isHiddenSwitch <- map["isHiddenSwitch"]
        isHiddenRightTip <- map["isHiddenRightTip"]
    }
}
 
 */

class SettingModel: NSObject {
    
    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    // 字典转model
     init(dict: [String: AnyObject]) {
        super.init()
        iconImage = dict["iconImage"] as? String
        leftTitle = dict["leftTitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
    }
}

