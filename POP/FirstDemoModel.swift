//
//  OneDemoModel.swift
//  POP
//
//  Created by 陈刚 on 16/9/6.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

struct FirstDemoDataModel {
    var mixedArray:[DateModelBox] = []
    init() {
        mixedArray += festivalsData.flatMap { DateModelBox(dic: $0, typeTag: "festival")}
        mixedArray += eventsData.flatMap {
            DateModelBox(dic: $0, typeTag: "event")
        }
        
        mixedArray.sort{
            switch ($0,$1) {
            case (.event(let first),.event(let second)):
                return first.date < second.date
            case (.festival(let first),.event(let second)):
                return first.date < second.date
            case (.event(let first),.festival(let second)):
                return first.date < second.date
            case (.festival(let first),.festival(let second)):
                return first.date < second.date
                
            }
        }
    }
    
}
