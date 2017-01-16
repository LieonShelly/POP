//
//  Model.swift
//  POP
//
//  Created by 陈刚 on 16/9/5.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

//节日模型
struct Festival:HasDate {
    var date = ""
    var festivalName = ""
    //新建构造器
    init(dic:[String:Any]){
        date = dic["date"] as? String ?? "日期错误"
        festivalName = dic["name"] as? String ?? "节日名错误"
    }
    
    //因为模型要放在数组中，也可以使用允许失败的构造器或者抛出错误的构造器，在填充数组时使用 flatMap：
    init?(dataDic:[String:Any]) {
        guard let date = dataDic["date"] as? String,
            let festivalName = dataDic["name"] as? String
        else {
            return nil
        }
        self.date = date
        self.festivalName = festivalName
    }
}
//待办事宜模型
struct Event:HasDate {
    var date = ""
    var eventTitle = ""
    //新增属性
    var warning = false
    //新建构造器
    init(dic:[String:Any]){
        date = dic["date"] as? String ?? "日期错误"
        eventTitle = dic["title"]  as? String ?? "事件名错误"
        //新增初始化
        warning = dic["warning"] as? Bool ?? false
    }
}

extension Festival:Model { }
extension Event:Model { }
