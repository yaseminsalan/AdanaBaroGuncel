//
//  BaroContactTableViewCell.swift
//  AdanaBaro
//
//  Created by yasemin salan on 20.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BaroContactTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var contactview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
