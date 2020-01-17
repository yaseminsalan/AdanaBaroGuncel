//
//  SozlesmeViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 17.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class SozlesmeViewController: UIViewController,SSRadioButtonControllerDelegate{

    
    var radioButtonController: SSRadioButtonsController?
    @IBOutlet weak var txt_sozlesme: UITextView!
    
    @IBOutlet weak var btn_select: UIButton!
    @IBAction func btn_select(_ sender: Any) {
     //   btn_select.backgroundColor=UIColor.red;
        
        
        
    }
    
    @IBAction func btn_onay(_ sender: Any) {
        
        if btn_select.isSelected==true{
            
              let durumkayıtlı=UserDefaults.standard.string(forKey: "sozlesmekabulk")
             let durummisafir=UserDefaults.standard.string(forKey: "sozlesmekabulm")
            if durumkayıtlı=="kayıtlı"{
                 UserDefaults.standard.set(true, forKey: "sozlesmekabulkayıtlı")
            }
            else if durummisafir=="misafir"{
                 UserDefaults.standard.set(true, forKey: "sozlesmekabulmisafir")
            }
            
            
            let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homepage") as! HomePageViewController
            self.present(vc, animated: true, completion: nil)
            print("butona tıklama olayı")
            
            
        }else{
            
            let alert = UIAlertController(title:"Bilgi", message:"Lütfen Kullanıcı sözleşmesini kabul ediniz.",preferredStyle: .alert)
                                                let action = UIAlertAction(title: "Tamam", style: .default)
                                                alert.addAction(action)
                                                self.present(alert,animated: true,completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButtonController = SSRadioButtonsController(buttons: btn_select)
               radioButtonController!.delegate = self
               radioButtonController!.shouldLetDeSelect = true
 
        // Do any additional setup after loading the view.
    }
    func didSelectButton(selectedButton: UIButton?)
       {
        NSLog(" \(selectedButton)" )
        
       
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
