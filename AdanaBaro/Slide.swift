//
//  Slide.swift
//  AdanaBaro
//
//  Created by Yasemin salan on 14.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class Slide: UIView {

    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var lblcomment: UILabel!
    
    
    @IBOutlet weak var btn_continue: UIButton!
    @IBAction func btn_continue(_ sender: Any) {
        
       
        
        
        let goBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as! LoginViewController
       // self.presentViewController(goBoard, animated: true, completion: nil)

       
        
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
