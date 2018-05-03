//
//  XiaoXi.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/5/2.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class XiaoXi: UITableViewCell {
    class func MyCell(_ tableView: UITableView) -> XiaoXi {
        var cell: XiaoXi? = tableView.dequeueReusableCell(withIdentifier: "cell2") as? XiaoXi
        if cell == nil {
            cell = Bundle.main.loadNibNamed("XiaoXi", owner: self, options: nil)?.first as? XiaoXi
        }
        return cell!
    }
    override var frame: CGRect{
        get {
            return super.frame
        }
        set (newFrame){
            let inset: CGFloat = 15
            var frame = newFrame
            frame.origin.x += inset
            //            frame.origin.y += 2 * inset
            frame.size.width -= 2 * inset
            frame.size.height -= 5
            super.frame = frame
        }
        }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
}
