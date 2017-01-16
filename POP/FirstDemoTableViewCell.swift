//
//  FirstDemoTableViewCell.swift
//  POP
//
//  Created by 陈刚 on 16/9/5.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

final class FirstDemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var warningBtn: UIButton!
    
    @IBOutlet weak var tagImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var buttonPressedClouse:(FirstDemoTableViewCell) -> Void = {cell in}
    
    @IBAction func cancelWarning(_ sender: UIButton) {
        buttonPressedClouse(self)
    }
}

extension FirstDemoTableViewCell:View,DemoShowedCell,ViewNameReusable{ }
