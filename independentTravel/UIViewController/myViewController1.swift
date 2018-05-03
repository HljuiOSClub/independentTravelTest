//
//  myViewController1.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit
let reuseIdentifier = "testCell"
class myViewController1: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    let BJWidth = UIScreen.main.bounds.size.width
    let BJHeight = UIScreen.main.bounds.size.height
    var flowLayout:UICollectionViewFlowLayout!
    var testCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let loopView = LoopView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 130))
        flowLayout = UICollectionViewFlowLayout.init()
         flowLayout.itemSize = CGSize(width:(BJWidth-20)/2 , height:(BJWidth-120)/2-30)
        testCollection = UICollectionView.init(frame: CGRect(x: 5, y: 140, width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.height), collectionViewLayout: flowLayout)

        
        testCollection.register(UINib(nibName: "TeleCell", bundle: nil), forCellWithReuseIdentifier: "testCell")
        testCollection.showsVerticalScrollIndicator = false
       testCollection.backgroundColor = UIColor.white
        self.view.addSubview(testCollection)
        self.view.addSubview(loopView)
        testCollection.delegate = self
        testCollection.dataSource = self
    
 
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testCollection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TeleCell
        
        cell.imageNameOne.image = UIImage(named: "10.jpg")
   
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//            let textController = WebViewController()
            var sb = UIStoryboard(name: "Main", bundle: nil)
            let textController = sb.instantiateViewController(withIdentifier: "text")
            self.navigationController?.pushViewController(textController, animated: true)
           
        
        
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
