//
//  PersonViewController.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/25.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        let cell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(named: items[indexPath.row])
        cell.textLabel?.text = itemStr[indexPath.row]
        cell.textLabel?.textColor = UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
        cell.textLabel?.font = UIFont(name: "PingFang SC", size: 18)   // 字体 和大小
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
}
