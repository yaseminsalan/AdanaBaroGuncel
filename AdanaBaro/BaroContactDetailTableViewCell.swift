//
//  BaroContactDetailTableViewCell.swift
//  AdanaBaro
//
//  Created by yasemin salan on 21.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BaroContactDetailTableViewCell: UITableViewCell {

 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_baslık: UILabel!
    
  //  @IBOutlet weak var image: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
