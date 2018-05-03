//
//  PersonCell.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/26.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var textTie: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    class func MyCell(_ tableView: UITableView) -> PersonCell {
        var cell: PersonCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? PersonCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("PersonCell", owner: self, options: nil)?.first as! PersonCell
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
