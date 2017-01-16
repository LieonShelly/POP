//
//  Potocol.swift
//  POP
//
//  Created by 陈刚 on 16/9/6.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

protocol HasDate {
    var date:String {get set}
}

//视图使用的协议
protocol View{
    func get<M:Model>(data model:M)
}

extension View {
    func get<M:Model>(data model:M){
        //默认不执行任何操作，因为此时的ViewType和ModelType都是协议，没有具体的信息
    }
}

extension View where Self:DemoShowedCell {
    func get<M:Model>(data model: M) {
        //先从公有的底层协议开始筛选，对于不是HasDate协议遵守者的模型提前返回
        guard let hasDate = model as? HasDate else{
            return
        }
        //公有部分
        dateLabel.text = hasDate.date
        //再筛选顶层类型
        if let festival = model as? Festival {
            //筛选出Festival模型进行绑定
            tagImageView.image = UIImage(named: "fes")
            titleLabel.text = festival.festivalName
        } else if let event = model as? Event {
            //筛选出Event模型进行绑定
            //组合
            var styleTuple:(imgName:String,color:UIColor,btnHidden:Bool) {
                if event.warning {
                    return ("eve_hl",UIColor.red,false)
                } else {
                    return ("eve",UIColor.black,true)
                }
            }
            //应用组合后的样式
            tagImageView.image = UIImage(named: styleTuple.imgName)
            titleLabel.textColor = styleTuple.color
            dateLabel.textColor = styleTuple.color
            warningBtn.isHidden = styleTuple.btnHidden
            titleLabel.text = event.eventTitle
        }
    }
}
//数据使用的协议
protocol Model{
}

extension Model {
    //使用Enum重构后应该是用不到了
    func give<V:View>(data view:V){
        view.get(data:self)
    }
    
}

//复用绑定逻辑的协议
protocol DemoShowedCell {
    weak var tagImageView: UIImageView!{get set}
    
    weak var titleLabel: UILabel!{get set}
    
    weak var dateLabel: UILabel!{get set}

    weak var warningBtn: UIButton!{get set}
    //新增一个泛型的闭包类型
    var buttonPressedClouse:(Self) -> Void{get set}
}

//别名，新语法很赞
typealias DateModel =  HasDate & Model

protocol SearchDate { }

extension SearchDate {
    //静态多态的搜索版本
    func search<D:DateModel>(_ source:[D],key:String) -> [D] {
        return source.filter{ $0.date.contains(key) }
    }
    
    //动态多态的搜索版本
    func search(_ source:[DateModel],key:String) -> [DateModel] {
        return source.filter{ $0.date.contains(key) }
    }
}
