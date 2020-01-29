//
//  BaroHeaderTableViewCell.swift
//  AdanaBaro
//
//  Created by yasemin salan on 20.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BaroHeaderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var lbl_baslık: UILabel!
}
