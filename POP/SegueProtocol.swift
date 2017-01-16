//
//  SegueProtocol.swift
//  POP
//
//  Created by Gang Chen on 16/12/22.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

//Segue的改造，参考 Natasha 的文章：https://www.natashatherobot.com/protocol-oriented-segue-identifiers-swift/

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController,
    SegueIdentifier.RawValue == String
{
    //利用自建的类型执行perform
    func performSegue(with identifier: SegueIdentifier,
                                    sender: Any?) {
        
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    //对于prepare方法，只需返回对应的Identifier
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {

        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Invalid segue identifier \(segue.identifier).") }
        
        return segueIdentifier
    }
}
