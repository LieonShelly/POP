//
//  ThirdDemoNormalTableViewCell.swift
//  POP
//
//  Created by 陈刚 on 16/9/5.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

final class ThirdDemoNormalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
}

extension ThirdDemoNormalTableViewCell:View{
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
            titleLabel.text = festival.festivalName
        } else if let event = model as? Event {
            //筛选出Event模型进行绑定
            titleLabel.text = event.eventTitle
        }
    }
}
