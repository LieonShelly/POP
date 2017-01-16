//
//  SeparatedTalViewController.swift
//  POP
//
//  Created by 陈刚 on 16/9/4.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

class SeparatedTalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ThirdDemoDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //去除tableview顶部的留白
        automaticallyAdjustsScrollViewInsets = false
    }

}

let thirdNormalCellId = "ThirdDemoNormalCell"
let thirdSectionCellId = "ThirdDemoSectionCell"
extension SeparatedTalViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.state.sectiontTuple.sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.state.sectiontTuple.rowNum[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: thirdNormalCellId, for: indexPath) as! ThirdDemoNormalTableViewCell
        switch data.state {
        case .onlyFes(let fesArray):
            cell.get(data:fesArray[indexPath.row])
        case .onlyEve(let eveArray):
            cell.get(data:eveArray[indexPath.row])
        case .both(let firstArray, let secondArray):
            if indexPath.section == 0 {
                cell.get(data:firstArray[indexPath.row])
            } else {
                cell.get(data:secondArray[indexPath.row])
            }
        case .none:
            break
        }
        return cell
    }
}

extension SeparatedTalViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = tableView.dequeueReusableCell(withIdentifier: thirdSectionCellId) as! ThirdDemoSectionTableViewCell
            headView.sectionTitleLabel.text = data.state.sectiontTuple.title[section]
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
