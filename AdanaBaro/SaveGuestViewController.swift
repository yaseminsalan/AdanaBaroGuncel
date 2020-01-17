//
//  SaveGuestViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 16.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class SaveGuestViewController: UIViewController {
    
    var UserInfoControl=true
    @IBOutlet weak var lbl_bilgi: UILabel!
    
    @IBOutlet weak var lbl_ad: UITextField!
    
    @IBOutlet weak var lbl_soyad: UITextField!
    
    @IBOutlet weak var lbl_email: UITextField!
    
    @IBOutlet weak var lbl_telno: UITextField!
    
    @IBOutlet weak var lbl_sifre: UITextField!
    
    
    @IBAction func btn_devam(_ sender: Any) {
        
        UserInfoControl=true
        getUserInfo()
          
         if UserInfoControl{
         
           let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                              let vc = storyboard.instantiateViewController(withIdentifier: "homepage") as! HomePageViewController
                              self.present(vc, animated: true, completion: nil)
          }
          
        
    }
    
    @IBOutlet weak var btn_devam: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func getUserInfo() {
    
       
        
      
      
     
        if (lbl_ad.text?.count)!>0 {
            var name=lbl_ad.text
            let upperString = name!.uppercased(with: Locale(identifier: "tr"))
            name=upperString
            print(name)
        }
        else{UserInfoControl=false;
            lbl_bilgi.isHidden=false
            lbl_bilgi.text="İsminizi Boş Bırakamayınız"
            return}
        
        if (lbl_soyad.text?.count)!>0 {
            var surname=lbl_soyad.text
            let upperString1 = surname!.uppercased(with:Locale(identifier: "tr"))
            surname=upperString1
            print(surname)
            //  TF_password.becomeFirstResponder()
        }
        else{UserInfoControl=false;
            lbl_bilgi.isHidden=false
            lbl_bilgi.text="Soyisminizi Boş Bırakmayınız"
            return}
        
        if  (lbl_email.text?.count)!>0{
            var mail=lbl_email.text
            
            // validate an email for the right format
            func isValidEmail(mail:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: mail)
            }
            if  isValidEmail(mail:mail!){
                mail=mail!
                print("dogru")
                print(mail)
                
            }else{UserInfoControl=false;
                
                lbl_bilgi.isHidden=false
                lbl_bilgi.text="mail formatında giriniz"
                 return
            }
        }else{
            UserInfoControl=false;
            lbl_bilgi.isHidden=false
            lbl_bilgi.text="mail Boş bırakılamaz"
             return
        }
        
        if  (lbl_sifre.text?.count)!>0{
            var password=lbl_sifre.text
            func isValidPassword(password:String?) -> Bool {
                guard password != nil else { return false }
                
                let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
                return passwordTest.evaluate(with: password)
            }
            if  isValidPassword(password:password){
                password=password!
                print("yeni..\(password)")}
        
            
            else{UserInfoControl=false;
                lbl_bilgi.isHidden=false
                lbl_bilgi.text="paswordu uygun formatta giriniz"
                return}
            // print("şifre..\(user.User_Password)")
        } else{UserInfoControl=false;
            lbl_bilgi.isHidden=false
            lbl_bilgi.text="şifre boş bırakılamaz"
            return}
        
      
       if (lbl_telno.text?.count)!>0{
            var phonenumber=lbl_telno.text
            phonenumber=String(phonenumber!)
           
        }else{
            UserInfoControl=false;
            lbl_bilgi.isHidden=false
            lbl_bilgi.text="Telefon Numarası Boş Bırakılamaz"
            return
        }
        
      
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              self.view.endEditing(true)
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
