//
//  ViewController.swift
//  POP
//
//  Created by 陈刚 on 16/9/3.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var evePattern: UISwitch!{
        didSet{
            evePattern.isOn = UserConfig.bool(forKey: .isEve)
        }
    }
    @IBAction func changePattern(_ sender: UISwitch) {
        UserConfig.set(evePattern.isOn, forKey: .isEve)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ViewController:SegueHandlerType {
    enum SegueIdentifier:String {
        case showMixedTal
        case showMixedCol
        case showSepTal
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .showMixedTal:
            print("打开第一个日历")
        case .showMixedCol:
            print("打开第二个日历")
        case .showSepTal:
            print("打开第三个日历")
        }
    }
    
}

