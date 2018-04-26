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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
