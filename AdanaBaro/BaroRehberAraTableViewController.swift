//
//  BaroRehberAraTableViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 22.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash

class BaroRehberAraTableViewController: UITableViewController {
var rehbermodelbirim = [rehber]()
    var aramadeger:String="";
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    BaroRehberbirim()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rehbermodelbirim.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
      let cell = tableView.dequeueReusableCell(withIdentifier: "AraCell", for: indexPath) as! BaroRehberAraTableViewCell
        // Configure the cell...

        return cell
    }
    
    func BaroRehberbirim(){
    // rehbermodeltip.removeAll()
     
    print("fonksiyon içi")
         let urlString = "\(API_URL)/get_courthouses_and_units_types.php"
         let url: NSURL = NSURL(string: urlString)!
         let sessions = URLSession.shared
         let request = NSMutableURLRequest(url: url as URL)
         request.httpMethod = "POST"
     
         
        
       let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
       let paramI = "I".base64Encoded()
       var customerıd="12"
       var unit_level = "3"
       var related_id = aramadeger
       var app_version_number = ""
       
       var device_type = ""
       unit_level = unit_level.base64Encoded()!
       related_id = related_id.base64Encoded()!
       app_version_number = app_version_number.base64Encoded()!
       device_type = device_type.base64Encoded()!
       customerıd = customerıd.base64Encoded()!
       
     
         
       let paramString = "param1=\(customerıd~?)&param2=\(unit_level~?)&param3=\(related_id~?)&param4=\(paramLanguageID~?)&param5=\(device_type~?)"
         request.httpBody = paramString.data(using: String.Encoding.utf8)
         
         let task = sessions.dataTask(with: request as URLRequest) { (data, response, error) in
             DispatchQueue.main.async() {
                 
                 // ERROR HANDLER
                 if response == nil {
                 //    SVProgressHUD.dismiss()
                   //  AppDelegate.showAlertError(AppDelegate.getConnectionErrorMessage())
                 }
                 else {
                    print("Tüm değerler \(response)")
                     if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                         
                       //  SVProgressHUD.show()
                         
                       let xml = SWXMLHash.parse("\(dataString)")
                       
                     
                         let xmlPath1 = xml["response"]["rows"]["row"]["part1"].element?.text.base64Decoded()
                       let xmlparh2 = xml["response"]["rows"]["row"]["part2"].element?.text.base64Decoded()
                            let xmlparh3 = xml["response"]["rows"]["row"]["part3"].element?.text.base64Decoded()
                       
                         if xmlPath1 == ""{
                            print("dönüş değeri boş")
                          //   SVProgressHUD.dismiss()
                           //  AppDelegate.showAlertError(AppDelegate.getConnectionErrorMessage())
                         }
                         else {
                             let result = xmlPath1
                            print("ara degeri \(result)")
                            let cardview = xmlPath1?.components(separatedBy: "[##]")
                            print("donüş değeri \(cardview?.count)")
                             
                          
                            for i in 0..<Int(cardview!.count){
                                
                                
                               let cardview1 = cardview?[i].components(separatedBy: "[#]")
                                let barorehberi = rehber()
                                barorehberi.Id = String((cardview1?[0])!)
                                barorehberi.title = String((cardview1?[1])!)
                              

                                self.rehbermodelbirim.append(barorehberi);
                                
                                
                            }
                        print("dizi içi  birimi\(self.rehbermodelbirim[0].title)")
                        //     print("dizi içi1\(self.cardviewmodel[1].title)")
                         //    print("dizi içi2\(self.cardviewmodel[2].title)")
                        //   self.collectionview.reloadData()
                            /*   self.slides = self.createSlides()
                           self.setupSlideScrollView(slides: self.slides)
                                 
                           self.pageControl.numberOfPages = self.slides.count
                           self.pageControl.currentPage = 0
                           self.view.bringSubviewToFront(self.pageControl)
                        */
                           
                           
                           /*  if result == "OK" {
                                 AppDelegate.setUserDefaults(userDetail?[0], key: "userId")
                                 AppDelegate.setUserDefaults(userDetail?[1], key: "userName")
                                 AppDelegate.setUserDefaults(userDetail?[2], key: "userPhoto")
                                 AppDelegate.setUserDefaults(userDetail?[3], key: "userProfession")
                                 AppDelegate.setUserDefaults(userDetail?[4], key: "userType")
                               //  AppDelegate.showAlertSuccess("Giriş Başarılı!")
                                 
                                 self.dismiss(animated: true, completion: nil)
                             }
                             else {
                           //      AppDelegate.showAlertError("Giriş yaparken hata oluştu!")
                             }*/
                         }
                       //  SVProgressHUD.dismiss()
                     }
                 }
             }
         }
         task.resume()
       
     }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
     override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 70;
          }
       override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = Bundle.main.loadNibNamed("BaroHeaderTableViewCell", owner: self, options: nil)?.first as? BaroHeaderTableViewCell;
    
              
          
                  headerView?.lbl_baslık.text = "Arama Sonuçları";
        headerView?.back.addTarget(self, action: #selector(self.buttonTapped(_:)), for: UIControl.Event.touchUpInside)
                  //headerView.customHedarImage.image = UIImage(named: "");
             
              
              return headerView;
          }
    
    @objc func buttonTapped( _ button : UIButton)
      {
         let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "barorehberStoryboard") as! BaroRehberViewController
               vc.aramadeger = aramadeger
         vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
      }
}
