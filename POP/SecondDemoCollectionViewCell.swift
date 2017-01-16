//
//  SecondDemoCollectionViewCell.swift
//  POP
//
//  Created by 陈刚 on 16/9/5.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

final class SecondDemoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var warningBtn: UIButton!
    @IBOutlet weak var tagImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var buttonPressedClouse:(SecondDemoCollectionViewCell) -> Void = {cell in}
    
    @IBAction func cancelWarning(_ sender: UIButton) {
        buttonPressedClouse(self)
    }
    
    override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5

    }
}

extension SecondDemoCollectionViewCell:View,DemoShowedCell{ }
