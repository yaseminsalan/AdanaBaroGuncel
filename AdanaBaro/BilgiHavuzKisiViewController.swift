//
//  BilgiHavuzKisiViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 23.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BilgiHavuzKisiViewController: UIViewController {

    
    var  name:String="";
    var email:String="";
    var phone:String="";
    var regions:String="";
    var desc:String="";
    var skill:String="";
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_phone: UILabel!
    @IBOutlet weak var lbl_regions: UILabel!
    @IBOutlet weak var lbl_desc: UILabel!
    
    @IBOutlet weak var lbl_skill: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_name.text=name
        lbl_email.text=email
        lbl_phone.text=phone
        lbl_regions.text=regions
        lbl_desc.text=desc
        lbl_skill.text=skill
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
