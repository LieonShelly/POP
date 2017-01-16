//
//  UsrDefaultsProtocol.swift
//  POP
//
//  Created by Gang Chen on 16/12/22.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import Foundation

//命名空间生成唯一Key，参考 Andyy Hope 的文章：https://realm.io/news/tryswift-andyy-hope-swift-eye-stringly-typed-api/

protocol KeyNamespaceable {
    static func namespaced<T:RawRepresentable>(_ key:T) -> String
}

extension KeyNamespaceable {
    static func namespaced<T:RawRepresentable>(_ key:T) -> String {
        print(String(describing: self) + ".\(key.rawValue)")
        return String(describing: self) + ".\(key.rawValue)"
    }
}

protocol BoolDefaultSettable:KeyNamespaceable {
    associatedtype BoolKey:RawRepresentable
}

extension BoolDefaultSettable where BoolKey.RawValue == String {
    static func set(_ value:Bool,forKey key:BoolKey) {
        UserDefaults.standard.set(value, forKey: namespaced(key))
    }
    
    static func bool(forKey key:BoolKey) -> Bool {
        return UserDefaults.standard.bool(forKey: namespaced(key))
    }
}

//protocol IntegerDefaultSettable {
    
//}
