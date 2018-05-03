//
//  FlyViewCell.swift
//  无限轮播
//
//  Created by 李亚非 on 2017/7/15.
//  Copyright © 2017年 李亚非. All rights reserved.
//

import UIKit

class FlyViewCell: UICollectionViewCell {

    @IBOutlet weak var imageOne: UIImageView!
    
   // @IBOutlet weak var imageView: UIImageView!
//    var imageView: UIImageView! = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 198))
//    var imageName: String = "" {
//        willSet{
//            imageView.image = UIImage(named: newValue)
//        }
//    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageView.contentMode = UIViewContentMode.scaleAspectFill
//        addSubview(imageView)
    }

}
