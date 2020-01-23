//
//  YayinlarDetayTableViewCell.swift
//  AdanaBaro
//
//  Created by yasemin salan on 22.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class YayinlarDetayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagename: UIImageView!
    
    @IBOutlet weak var lbl_name: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
