//
//  MixedColViewController.swift
//  POP
//
//  Created by 陈刚 on 16/9/4.
//  Copyright © 2016年 陈刚. All rights reserved.
//

//第二个控制器保留了原来的写法，专门留给大家做参照的。大家可以对比看，这里的一些理解实际上是错误的
import UIKit

class MixedColViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = SecondDemoDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//这样的写法会“污染”公共命名空间
let secondCellId = "SecondDemoCell"

extension MixedColViewController:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.mixedArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath) as! SecondDemoCollectionViewCell
        
        //使用Enum重构数组后，不会再用到give方法了。
        data.mixedArray[indexPath.row].give(data:cell)
        cell.buttonPressedClouse = {[unowned self] cell in
            if let indexPath = self.collectionView.indexPath(for: cell){
                //把Cell绑定的旧数据赋值到一个新的可变对象中
                //之前的旧写法，as！可以被干掉了，请参照第一个控制器中的代码
                var event =  self.data.mixedArray[indexPath.row] as! Event
                //修改该对象中的值
                event.warning = false
                //通过赋值的方法替换掉旧数据
                self.data.mixedArray[(indexPath as NSIndexPath).row] = event
                //因为Cell是引用类型，可以通过重新绑定刷新页面，替代tableview的刷新方法
                cell.get(data:event)
                //你也可以用下面的系统方法
                //self.collectionView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
                //打印数据，查看效果
                print(self.data.mixedArray)
            }
        }
        return cell
    }
}
