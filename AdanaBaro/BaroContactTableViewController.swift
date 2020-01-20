//
//  BaroContactTableViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 20.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash
class BaroContactTableViewController: UITableViewController {

        var contactmodel=[contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
            Contact()
      self.tableView.tableFooterView = UIView();
    
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
        return contactmodel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaroCell", for: indexPath) as! BaroContactTableViewCell

        // Configure the cell...
        let borderkontrol = contactmodel[indexPath.row].contact_units_id
        
        if(borderkontrol=="1"){
        
            cell.contactview.layer.cornerRadius=5
           cell.contactview.layer.borderWidth=2
            cell.contactview.layer.borderColor=UIColor.red.cgColor
            cell.lbl_title.text = contactmodel[indexPath.row].title
        }
        else if(borderkontrol=="2"){
            cell.lbl_title.text=contactmodel[indexPath.row].title
        }
        else{
            print("beklenmedik bir hata oluştu")
        }
        
        return cell
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
 
           
       
             //  headerView?.lbl_baslık.text = "İlk custom header";
               //headerView.customHedarImage.image = UIImage(named: "");
          
           
           return headerView;
       }
    
    
    func Contact(){
    print("fonksiyon içi")
         let urlString = "\(API_URL)/get_contact_units.php"
         let url: NSURL = NSURL(string: urlString)!
         let sessions = URLSession.shared
         let request = NSMutableURLRequest(url: url as URL)
         request.httpMethod = "POST"
     
         
        
         let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
         let paramI = "I".base64Encoded()
       var customerıd="12"
       
       var device_type = ""
      
       device_type = device_type.base64Encoded()!
       customerıd = customerıd.base64Encoded()!
       
     
         
       let paramString = "param1=\(customerıd~?)&param2=\(paramLanguageID~?)&param3=\(device_type~?)"
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
                     
                       
                         if xmlPath1 == nil{
                            print("dönüş değeri boş")
                          //   SVProgressHUD.dismiss()
                           //  AppDelegate.showAlertError(AppDelegate.getConnectionErrorMessage())
                         }
                         else {
                             let result = xmlPath1
                            print("part1 degeri \(result)")
                            let cardview = xmlPath1?.components(separatedBy: "[##]")
                            print("donüş değeri \(cardview?.count)")
                             
                          
                            for i in 0..<Int(cardview!.count){
                                
                                
                               let cardview1 = cardview?[i].components(separatedBy: "[#]")
                                let contactlist=contact()
                               contactlist.Id=String((cardview1?[0])!)
                               contactlist.contact_units_id = String((cardview1?[1])!)
                                contactlist.title = String((cardview1?[2])!)
                               contactlist.phone = String((cardview1?[3])!)
                               contactlist.extension_number = String((cardview1?[4])!)
                               contactlist.fax = String((cardview1?[5])!)
                               contactlist.adress = String((cardview1?[6])!)
                                contactlist.lat = String((cardview1?[7])!)
                                contactlist.Ing = String((cardview1?[8])!)

                                self.contactmodel.append(contactlist);
                                
                            
                            }
                           self.tableView.reloadData()
                           
                             print("dizi içi\(self.contactmodel[0].title)")
                             print("dizi içi1\(self.contactmodel[1].title)")
                             print("dizi içi2\(self.contactmodel[2].title)")
                        
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
    
}
