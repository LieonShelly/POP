//
//  TableView.swift
//  POP
//
//  Created by Gang Chen on 16/12/22.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ViewNameReusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

//参考了 Russ Bishop 的文章：http://swift.gg/2016/12/05/quick-easy-dispatchtime/ 恰好是我翻译的

extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}

extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}

