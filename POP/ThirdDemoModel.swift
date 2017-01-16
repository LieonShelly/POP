//
//  ThirdDemoModel.swift
//  POP
//
//  Created by 陈刚 on 16/9/11.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

struct ThirdDemoDataModel {

    enum DataState {
    case none
    case onlyFes(fesArray:[Festival])
    case onlyEve(eveArray:[Event])
    case both(fesArray:[Festival],eveArray:[Event])
        //计算属性，充当了填充tableview的数据模板
        var sectiontTuple:(sectionNum:Int,rowNum:[Int],title:[String]){
            switch self {
            case .none:
                return (0,[],[])
            case .onlyEve(let eveArray):
                return (1,[eveArray.count],["待办事宜"])
            case .onlyFes(let fesArray):
                return (1,[fesArray.count],["节日"])
            case .both(let eveArray,let fesArray):
                return (2,[fesArray.count,eveArray.count],["节日","待办事宜"])
            }
        }
    }
    var state = DataState.none
    init() {
        var festivalsArray = festivalsData.map{ Festival(dic:$0) }
        var eventsArray = eventsData.map{ Event(dic:$0) }
        festivalsArray.sort{ $0.date < $1.date }
        eventsArray.sort{ $0.date < $1.date }
        //你可以用下面的方法测试数据
        //eventsArray.removeAll()
        //festivalsArray.removeAll()
        switch (festivalsArray.count,eventsArray.count) {
        case (0,0):
            state = .none
        case (_,0):
            state = .onlyFes(fesArray: festivalsArray)
        case(0,_):
            state = .onlyEve(eveArray: eventsArray)
        default:
            state = .both(fesArray: festivalsArray,eveArray: eventsArray)
        }
    }
}
