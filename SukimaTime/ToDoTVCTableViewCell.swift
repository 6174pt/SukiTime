//
//  ToDoTVCTableViewCell.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/10/09.
//

import UIKit

class ToDoTVCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoView:UIView!
    @IBOutlet weak var todoimg:UIImageView!
    @IBOutlet weak var todoLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var minuteLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
