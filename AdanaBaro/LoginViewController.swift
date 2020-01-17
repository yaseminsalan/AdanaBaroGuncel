//
//  LoginViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 15.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBAction func kayıtlı_kullanıcı(_ sender: Any) {
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "registered") as! Registered_UserViewController
               self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btn_login(_ sender: Any) {
      
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "saveguest") as! SaveGuestViewController
        self.present(vc, animated: true, completion: nil)
      /*  let storyboard: UIStoryboard = UIStoryboard(name: “Main”, bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: “SecondVc”) as! SecondViewController

        self.present(vc, animated: true, completion: nil)*/
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
