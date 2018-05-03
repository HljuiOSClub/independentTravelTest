//
//  TitleZoomVC.swift
//  ZCYPageView
//
//  Created by 钟淳亚 on 2018/1/11.
//  Copyright © 2018年 钟淳亚. All rights reserved.
//

import UIKit

class TitleZoomVC: UIViewController {
    
    private var mPageTitleView: ZCYPageTitleView!
    private var mPageContentView: ZCYPageContentView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.gray
        let conf = ZCYPageTitleConfig()
        conf.titleZoomSwitch = true
        conf.titleColor = UIColor.white
        conf.titleSelectedColor = UIColor.white
        var rect = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 60)
        let titleArr = ["自攻略", "自助游", "自带游", "自教程", "自推荐"]
        
        mPageTitleView = ZCYPageTitleView(frame: rect, titleArr: titleArr, config: conf, delegate: self)
        mPageTitleView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        self.view.addSubview(mPageTitleView)
        
        let vc1 = myViewController1()
        vc1.view.backgroundColor = UIColor.white
        let vc2 = myViewController2()
        vc2.view.backgroundColor = UIColor.brown
        let vc3 = myViewController3()
        vc3.view.backgroundColor = UIColor.red
        let vc4 = myViewController4()
        vc4.view.backgroundColor = UIColor.green
        let vc5 = myViewController5()
        vc5.view.backgroundColor = UIColor.orange
       
        
        rect = CGRect(x: 0, y: 124, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let arr = [vc1, vc2, vc3, vc4, vc5]
        mPageContentView = ZCYPageContentView(frame: rect, parentVC: self, childVCs: arr, delegate: self)
        self.view.addSubview(mPageContentView)
    }
}

extension TitleZoomVC: ZCYPageTitleViewDelegate {
    func selectPageTitleView(_ pageTitleView: ZCYPageTitleView, withIndex index: Int) {
        mPageContentView.setPageContentViewWithIndex(index)
    }
}

extension TitleZoomVC: ZCYPageContentViewDelegate {
    func scrollPageContentView(_ pageContentView: ZCYPageContentView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        mPageTitleView.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
