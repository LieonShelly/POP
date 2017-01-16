//
//  BoxEnum.swift
//  POP
//
//  Created by Gang Chen on 16/12/21.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

//参考了 Andyy Hope 的文章:http://swift.gg/2016/11/29/swift-typecasing/ 恰好是我翻译的
enum DateModelBox{
    case festival(Festival)
    case event(Event)
    private enum ModelType:String{
        case festival,event
        //static let key = "type"
    }
    //typeTag 如果是本地控制的则不需要使用String，这里使用String是为了模拟从JSON中解析得到的值。
    init?(dic:[String:Any],typeTag:String) {
        guard let type = ModelType(rawValue: typeTag) else{
            return nil
        }
        switch type {
        case .festival:
            self = .festival(Festival(dic: dic))
        case .event:
            self = .event(Event(dic:dic))
        }
    }
}

