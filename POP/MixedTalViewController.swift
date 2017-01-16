//
//  MixedTalViewController.swift
//  POP
//
//  Created by 陈刚 on 16/9/4.
//  Copyright © 2016年 陈刚. All rights reserved.
//

import UIKit

class MixedTalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = FirstDemoDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //去除tableview顶部的留白
        automaticallyAdjustsScrollViewInsets = false
        
        //为了使用一下 DispatchTime ，强行加了一个刷新方法
        DispatchQueue.main.asyncAfter(deadline: 3.5) {
            self.tableView.reloadData()
            print("刷新了一下")
        }
    }
}

extension MixedTalViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.mixedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FirstDemoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        switch data.mixedArray[indexPath.row] {
        case .event(let event):
            cell.get(data: event)
        case .festival(let festival):
            cell.get(data: festival)
        }
        cell.buttonPressedClouse = {[unowned self] cell in
            if let indexPath = self.tableView.indexPath(for: cell){
                //把Cell绑定的旧数据赋值到一个新的可变对象中
                if case .event(var event) = self.data.mixedArray[indexPath.row] {
                    //这里只是模拟，不会修改数据源中的值
                    //修改该对象中的值
                    event.warning = false
                    //通过赋值的方法替换掉旧数据
                    self.data.mixedArray[indexPath.row] = .event(event)
                    //因为Cell是引用类型，可以通过重新绑定刷新页面，替代tableview的刷新方法
                    cell.get(data:event)
                    //你也可以用下面的系统方法
                    self.tableView.reloadRows(at: [indexPath], with: .none)
                    //打印数据，查看效果
                    print(self.data.mixedArray)
                }
            }
        }
        return cell
    }
}
