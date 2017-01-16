//
//  CellIdentifierProtocol.swift
//  POP
//
//  Created by Gang Chen on 16/12/22.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

//Cell的重用，参考 Natasha 的文章：https://realm.io/cn/news/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/

protocol ViewNameReusable:class { }

extension ViewNameReusable where Self:UIView {
    static var reuseIdentifier:String {
        return String(describing: self)
    }
}




