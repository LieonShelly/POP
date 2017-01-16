//
//  SecondDemoModel.swift
//  POP
//
//  Created by 陈刚 on 16/9/11.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

struct SecondDemoDataModel {
    var festivalsArray = festivalsData.map{ Festival(dic:$0) }
    var eventsArray = eventsData.map{ Event(dic:$0) }
    var mixedArray:[DateModel] = []
    init() {
        festivalsArray.forEach{ mixedArray.append($0) }
        eventsArray.forEach{ mixedArray.append($0) }
        //原地排序
        mixedArray.sort{ $0.date < $1.date }
    }
}
