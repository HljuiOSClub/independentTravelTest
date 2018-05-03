//
//  myViewController2.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class myViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var tableView1 :UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1 = UITableView(frame: view.bounds)
        tableView1.delegate = self
        tableView1.dataSource = self
        self.view.addSubview(tableView1)
        tableView1.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView1.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView1.tableFooterView = UIView()
        tableView1.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = TableViewCell2()
        cell = TableViewCell2.MyCell(tableView1)
        cell.frame = CGRect(x: 10, y: 20, width: 200, height: 40)
//        cell.icon?.image = UIImage(named: items[indexPath.row])
     
   
                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.black.cgColor
                cell.layer.cornerRadius = 10
                cell.layer.masksToBounds = true
                cell.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
