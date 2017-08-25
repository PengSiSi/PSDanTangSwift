
//
//  NetWorkTool.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON
import ObjectMapper

class NetWorkTool: NSObject {
    
    // 单例
    static let shareNetWorkTool = NetWorkTool()
    
    // 1. 获取首页顶部选择数据
    func loadHomeTopData(finished:@escaping (_ channels: [ChannelModel]) -> ()) {

        let url = "http://api.dantangapp.com/v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire.request(url, method: .get, parameters: params, encoding:
            URLEncoding.httpBody, headers: nil).responseJSON { (response) in
                print("response----\(response.result.value)")
                guard response.result.isSuccess else {
                    
                    SVProgressHUD.showError(withStatus: "加载失败")
                    return
                }
                if let value = response.result.value {
                    
                    let dic = JSON(value)
                    let code = dic["code"].intValue
//                    let message = dic["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showError(withStatus: "加载失败")
                        return
                    }
                    // 到这里数据加载成功
                    SVProgressHUD.dismiss()
                    // json转model
                    let data = dic["data"].dictionary
                    var channelsArray = [ChannelModel]()
                    if let channels: [[String: AnyObject]] = data?["candidates"]?.arrayObject as! [[String : AnyObject]]? {
                        for channel in channels {
                            let model = ChannelModel(dict: channel)
                            channelsArray.append(model)
                        }
                    }
                    finished(channelsArray)
                }
         }
    }
    
    // 2.获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [HomeListModel]) -> ()) {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.httpBody).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                // 一定有值
                let data = dic["data"].dictionary
                // 字典转模型
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                var homeArray = [HomeListModel]()
                    for item in items {
                        
                        let model = HomeListModel(dict: item)
                        homeArray.append(model)
                    }
                    finished(homeArray)
                }
            }
        }
    }
    
    //  3.获取"单品"界面列表数据  闭包传递数据源  参数要加_
    func loadGiftListData(completion: @escaping (_ giftModels: [GiftModel]) -> ()) {
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request("http://api.dantangapp.com/v2/items?gender=1&generation=1&limit=20&offset=0", parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            print("response----\(response.result.value)")
//            guard response.result.isSuccess else {
//                SVProgressHUD.showError(withStatus: "加载失败")
//            }
            // 解析数据
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                SVProgressHUD.dismiss()
                let data = dic["data"].dictionary
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                    var gifts = [GiftModel]()
                    for item  in items {
                        if let dataDic = item["data"] {
                            let gift = GiftModel.init(dict: dataDic as! [String: Any] as [String : AnyObject])
                            gifts.append(gift)
                        }
                    }
                    completion(gifts)
                }
            }
        }
    }
    
    // 4.搜索热门关键字数据
    func loadHotWords(_ finish: @escaping (_ words: [String]) -> ()) {
        
        SVProgressHUD.showInfo(withStatus: "正在加载")
        let url = "http://api.dantangapp.com/v1/search/hot_words"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showInfo(withStatus: "加载失败")
                return
            }
            // 存在数据
            if let value = response.result.value {
             let dict = JSON(value)
            let code = dict["code"].intValue
//            let message = dict["message"].stringValue
            guard code == RETURN_OK else {
                SVProgressHUD.showInfo(withStatus: "加载失败")
                return
            }
            SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let hotwords = data["hot_words"]?.arrayObject {
                        
                        // 值回调
                        finish(hotwords as! [String])
                    }
                }
            }
        }
    }
    
    // 5.根据搜索条件进行搜索
    func loadSearchResult(_ keyword: String, _ sort: String, _ finished:@escaping (_ results: [SearchResult]) -> ()) {
        
        SVProgressHUD.showInfo(withStatus: "正在加载")
        let url = "http://api.dantangapp.com/v1/search/item"
        let param = ["keyword": keyword,
                     "limit": 20,
                     "offset": 0,
                     "sort": sort] as [String : Any]
        Alamofire.request(url, method: .get, parameters: param, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                SVProgressHUD.showInfo(withStatus: "加载失败")
                return
            }
            // 有值,解析数据
            if let value = response.result.value {
                
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                    var resultArray = [SearchResult]()
                    for item in items {
                        
                        let model = SearchResult()
                        resultArray.append(model)
                    }
                    finished(resultArray)
                }
            }
        }
    }
    
    // 5.获取分类列表数据
    
    func loadCategoryListData(completion: @escaping (_ categoryModels: [CategoryModel]) -> ()) {
        let url = BASE_URL + "v1/channel_groups/all?"
        Alamofire.request("http://api.dantangapp.com/v1/channel_groups/all?", parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            print("response----\(response.result.value)")
            //            guard response.result.isSuccess else {
            //                SVProgressHUD.showError(withStatus: "加载失败")
            //            }
            // 解析数据
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                SVProgressHUD.dismiss()
                let data = dic["data"].dictionary
                if let items: [[String: AnyObject]] = data?["channel_groups"]?.arrayObject as! [[String : AnyObject]]? {
                    var categorys = [CategoryModel]()
                    for item  in items {
                        
                        // 存放数组的数组
                        var array: Array = [AnyObject]()
                        
                        if let channels: [[String: AnyObject]] = item["channels"] as! [[String : AnyObject]]? {
                            for channel in channels{
                                
                                let category = CategoryModel.init(dict: channel as! [String: AnyObject] as [String : AnyObject])
                                categorys.append(category)
                            }
//                            array.append(categorys as AnyObject)
                            completion(categorys)
                        }
                    }
                }
            }
        }
    }
    
    // 6.获取分类详情数据
    func loadCategoryDetailData(completion: @escaping (_ homeListModels: [HomeListModel]) -> ()) {
        Alamofire.request("http://api.dantangapp.com/v1/channels/12/items?limit=20&offset=0", parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            print("response----\(response.result.value)")
            //            guard response.result.isSuccess else {
            //                SVProgressHUD.showError(withStatus: "加载失败")
            //            }
            // 解析数据
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                SVProgressHUD.dismiss()
                let data = dic["data"].dictionary
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                    var categoryDetailArray = [HomeListModel]()
                    for item in items {
                        
                        let model = HomeListModel(dict: item)
                        categoryDetailArray.append(model)
                    }
                    completion(categoryDetailArray)
                }
            }
        }
    }

}
