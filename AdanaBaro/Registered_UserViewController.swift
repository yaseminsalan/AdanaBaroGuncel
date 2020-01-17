//
//  Registered_UserViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 16.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class Registered_UserViewController: UIViewController {

    var UserInfoControl=true
    
    var user:Int=0
  
    
    @IBAction func btn_back(_ sender: Any) {
    }
    
    @IBOutlet weak var lbl_bilgi: UILabel!
    
    
    @IBOutlet weak var lbl_user: UITextField!
    
    
    @IBOutlet weak var lbl_password: UITextField!
    
    
    @IBAction func btn_login(_ sender: Any) {
       
             UserInfoControl=true;
         getUserInfo()
               if UserInfoControl{
                     
                 if (lbl_user.text == String(12345678912)) && (lbl_password.text == String(123)){
                       
                  
                    let sozlesme=UserDefaults.standard.bool(forKey: "sozlesmekabulkayıtlı")
                             if sozlesme{
                                 let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                              let vc = storyboard.instantiateViewController(withIdentifier: "homepage") as! HomePageViewController
                                                              self.present(vc, animated: true, completion: nil)
                             }else{
                                
                                 UserDefaults.standard.set("kayıtlı", forKey: "sozlesmekabulk")
                                 let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                              let vc = storyboard.instantiateViewController(withIdentifier: "sozlesme") as! SozlesmeViewController
                                                              self.present(vc, animated: true, completion: nil)
                             }
                    
                 
                       
                   }else{
                       lbl_bilgi.isHidden=false
                       lbl_bilgi.text="Kullanıcı kodu ve Şifrenizi Kontrol ediniz"
                       
                   }
                
                
                
                
                
                
                
                
                
                
                      }
        
       // if lbl_user.text==""
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
         lbl_bilgi.isHidden=true
      
          // Do any additional setup after loading the view.
      }
    
       func getUserInfo() {
       
          
           
           if (lbl_user.text?.count)!>0 || (lbl_user.text?.count)!<11
           {let tc=lbl_user.text
               user=Int(tc!)!}
           else{UserInfoControl=false;
               lbl_bilgi.isHidden=false
               lbl_bilgi.text="Lütfen 11 haneli Kimlik Numaranızı Giriniz"
               return}
         
        
         /*  if let gender:Int=TF_gender.selectedSegmentIndex{
               if gender==0
               {
                   user.User_Gender="Erkek"
               }
               else{
                   user.User_Gender="Kadın"
               }
           }
           else{UserInfoControl=false;
               MailBilgi_lbl.isHidden=false
               MailBilgi_lbl.text="Cinsiyetinizi Seçiniz"
               return}*/
           return
       
       }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
       
    

}
