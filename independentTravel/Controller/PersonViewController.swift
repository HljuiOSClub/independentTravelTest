//
//  PersonViewController.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/25.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var personTableView: UITableView!

    var items = ["行程","上传","关注","收藏","收件箱","设置","发送反馈"]
    var itemStr = ["行程","上传","关注","收藏","收件箱","设置","发送反馈"]
    override func viewDidLoad() {
        super.viewDidLoad()
        personTableView.delegate = self
        personTableView.dataSource = self
        personTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        personTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        personTableView.tableFooterView = UIView()
        personTableView.reloadData()
        
        avatar.image = UIImage(named: "Goku")?.toCircle()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var cell = PersonCell()
        cell = PersonCell.MyCell(personTableView)
        cell.icon?.image = UIImage(named: items[indexPath.row])
        cell.textTie?.text = itemStr[indexPath.row]
        cell.textTie?.textColor = UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
        cell.textTie?.font = UIFont(name: "PingFang SC", size: 18)   // 字体 和大小
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if itemStr[indexPath.row] == "上传" {
            var updateController = storyboard?.instantiateViewController(withIdentifier: "update")
            self.navigationController?.pushViewController(updateController!, animated: true)
        }
    }
}
extension UIImage {
    //生成圆形图片
    func toCircle() -> UIImage {
        //取最短边长
        let shotest = min(self.size.width, self.size.height)
        //输出尺寸
        let outputRect = CGRect(x: 0, y: 0, width: shotest, height: shotest)
        //开始图片处理上下文（由于输出的图不会进行缩放，所以缩放因子等于屏幕的scale即可）
        UIGraphicsBeginImageContextWithOptions(outputRect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        //添加圆形裁剪区域
        context.addEllipse(in: outputRect)
        context.clip()
        //绘制图片
        self.draw(in: CGRect(x: (shotest-self.size.width)/2,
                             y: (shotest-self.size.height)/2,
                             width: self.size.width,
                             height: self.size.height))
        //获得处理后的图片
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return maskedImage
    }
}
