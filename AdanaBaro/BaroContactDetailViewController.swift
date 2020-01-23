//
//  BaroContactDetailViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 21.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class BaroContactDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
       var kisibilgi:[String] = []
    var sabitbilgi:[String] = ["Birim Personeli:","Telefon No:","Dahili No:","Fax No:","Adres:"]
  //  var imagedizi:[UIImage] = [UIImage(named: "EPOSTA")!,UIImage(named: "EPOSTA")!]
    
    @IBOutlet weak var harita_view: UIView!
    
  
    @IBOutlet weak var tableview: UITableView!
    
    
    @IBOutlet weak var yol_tarifi: UIButton!
    
    @IBAction func yol_tarifi(_ sender: Any) {
    }
    @IBOutlet weak var ara: UIButton!
    
    
    @IBAction func ara(_ sender: Any) {
    }
    
    
    @IBAction func back(_ sender: Any) {
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BaroContactStoryboard") as! BaroContactTableViewController
         self.present(vc, animated: true, completion: nil)
    }
    
    var adres = "";
      var name = "";
      var surname="";
      var tel1 = "";
      var tel2 = "";
    var dahili="";
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       harita_view.layer.cornerRadius=7
      harita_view.layer.borderWidth=2
      //  harita_view.layer.backgroundColor = UIColor.red.cgColor
        harita_view.layer.borderColor = UIColor.red.cgColor
        
     
        kisibilgi.append(name)
        kisibilgi.append(tel1)
        kisibilgi.append(dahili)
        kisibilgi.append(tel2)
        kisibilgi.append(adres)
        
        tableview.tableFooterView = UIView();
          //tableview.tableFooterView=UIView();
        print("gelendeger \(kisibilgi[1])")
              print("gelendeger \(name)")
              print("gelendeger \(surname)")
              print("gelendeger \(tel1)")
              print("gelendeger \(tel2)")
        // Do any additional setup after loading the view.
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 5
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "BarodetailCel", for: indexPath) as? BaroContactDetailTableViewCell
       
        cell?.lbl_name.text=kisibilgi[indexPath.row]
        cell?.lbl_baslık.text = sabitbilgi[indexPath.row]
        //cell?.image?.images=imagedizi[indexPath.row]
          
          return cell!
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
