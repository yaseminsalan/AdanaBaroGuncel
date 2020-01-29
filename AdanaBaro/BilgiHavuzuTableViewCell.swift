//
//  BilgiHavuzuTableViewCell.swift
//  AdanaBaro
//
//  Created by yasemin salan on 23.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BilgiHavuzuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var poolview: UIView!
    @IBOutlet weak var image_name: UIImageView!
    
    @IBOutlet weak var lbl_bilgi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
