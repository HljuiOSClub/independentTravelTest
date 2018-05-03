//
//  LoopView.swift
//  无限轮播
//
//  Created by 李亚非 on 2017/7/15.
//  Copyright © 2017年 李亚非. All rights reserved.
//

import UIKit

class LoopView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    let kHeight = UIScreen.main.bounds.size.height  // 获取设备的高
    let kWidth = UIScreen.main.bounds.size.width    //获取设备的宽
    
    var collection: UICollectionView!    // 多样的cell的视图
    var pageControl: WEIPageControl!       //页面控制器
    var currentPage = 0                   //第几页 从1开始
    var imagesArray = ["4.jpg","1.jpg","2.jpg","3.jpg","4.jpg","1.jpg"]
    var timer : Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        let flowLayout = UICollectionViewFlowLayout.init()   //系统提供给我们一个封装好的流布局设置类
        flowLayout.itemSize = CGSize(width: kWidth, height: self.bounds.size.height) //设置每个item的大小 
        flowLayout.minimumLineSpacing = 0   //设置行与行之间的间距最小距离
        flowLayout.minimumInteritemSpacing = 0  //设置列与列之间的间距最小距离
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal  // 设置布局方向  horizontal  水平               垂直  vertical
        collection = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        collection.backgroundColor = UIColor.white
        
        collection.register(UINib(nibName: "FlyViewCell", bundle: nil), forCellWithReuseIdentifier: "FlyViewCell")
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true   // 是否分页
        collection.showsHorizontalScrollIndicator = false // 不显示水平滑动条
        self.addSubview(collection)
        
        pageControl = WEIPageControl.init(frame: CGRect(x: 0, y: self.bounds.size.height - 20, width: kWidth, height: 20))

        pageControl.currentWidthMultiple = 1.5
        pageControl.currentColor = UIColor.white
        pageControl.otherColor = UIColor.white
        pageControl.pointSize = CGSize.init(width: 35, height: 4)//方点的size
        pageControl.numberOfPages = imagesArray.count - 2

        self.addSubview(pageControl)
        collection.reloadData()
        collection.setContentOffset(CGPoint(x: kWidth, y: 0), animated: false)    // 是否可以滚到指定位置   监控目前滚动的位置
        addTimer()
    }
    func addTimer(){     // 添加定时器  实现自动轮播
        let tm = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(nextPage), userInfo: nil, repeats: true)
        RunLoop.current.add(tm, forMode: .commonModes)             // RunLoop 内部是一个do-while 循环
        timer = tm
    }
    func removeTimer(){
        timer?.invalidate()         // 销毁定时器
        timer = nil
    }
    @objc func nextPage() {                                         //  触发 页面滚动
        currentPage += 1
        collection.setContentOffset(CGPoint(x: CGFloat(currentPage)*kWidth, y: 0), animated: true)
        if currentPage == imagesArray.count - 1 {           //
            currentPage = 1
            collection.setContentOffset(CGPoint(x: kWidth, y: 0), animated: true)
        }else{
            pageControl.currentPage = currentPage - 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {                    // 重用池
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlyViewCell", for: indexPath) as! FlyViewCell
//        cell.imageName = imagesArray[indexPath.row]
        cell.imageOne.image = UIImage(named: imagesArray[indexPath.row])
        return cell
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {    //当开始滚动视图时，执行该方法。 手动滑动的时候销毁定时
        removeTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {   // 滑动视图，当手指离开屏幕那一霎那，重新添加定时器
        addTimer()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {         // 滚动视图减速完成，滚动将停止时，调用该方法。设置当前的pagecontrol
        let page = scrollView.contentOffset.x / kWidth
        currentPage = Int(page)
        pageControl.currentPage = Int(page) - 1
        
        if currentPage == 0 {
            pageControl.currentPage = imagesArray.count - 1
            scrollView.setContentOffset(CGPoint(x: CGFloat((imagesArray.count - 2))*kWidth, y: 0), animated: false)
        }
        if currentPage == imagesArray.count - 1 {
            pageControl.currentPage = 0
            scrollView.setContentOffset(CGPoint(x:kWidth, y:0), animated: false)
        }

    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {  // scrollView滚动时，就调用该方法。任何offset值改变都调用该方法。即滚动过程中，调用多次
        let page = scrollView.contentOffset.x / kWidth
        currentPage = Int(page)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let message = "第\(indexPath.item % imagesArray.count)张图片"
//        print(message)
    }
}

