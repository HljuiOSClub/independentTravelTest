//
//  TableViewCell2.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

    class func MyCell(_ tableView: UITableView) -> TableViewCell2 {
        var cell: TableViewCell2? = tableView.dequeueReusableCell(withIdentifier: "cell2") as? TableViewCell2
        if cell == nil {
            cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
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
