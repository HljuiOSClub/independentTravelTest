//
//  WebViewController.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建
        let wkWebView = WKWebView()
        
        //设置位置和大小
        wkWebView.frame = self.view.frame;
        
        //创建的时候就设置位置和大小
        /*
         public init(frame: CGRect, configuration: WKWebViewConfiguration)
         */
   
        
        //添加
        self.view.addSubview(wkWebView)
        
        //请求
        /*
         open func load(_ request: URLRequest) -> WKNavigation?
         */
        
        wkWebView.load(NSURLRequest(url: NSURL(string:"http://www.bilibili.com") as! URL) as URLRequest)
        
     
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

}
