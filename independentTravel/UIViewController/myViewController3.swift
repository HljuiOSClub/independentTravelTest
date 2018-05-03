//
//  myViewController3.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class myViewController3: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var tableView2:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2 = UITableView(frame: view.bounds)
        tableView2.delegate = self
        tableView2.dataSource = self
        self.view.addSubview(tableView2)
        tableView2.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView2.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView2.tableFooterView = UIView()
        tableView2.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = TableViewCell3()
        cell = TableViewCell3.MyCell(tableView2)
        cell.frame = CGRect(x: 10, y: 10, width: 200, height: 40)
        //        cell.icon?.image = UIImage(named: items[indexPath.row])
        
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 0
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
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


