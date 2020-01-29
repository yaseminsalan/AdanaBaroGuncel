//
//  BilgiHavuzuDetayViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 23.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash

class BilgiHavuzuDetayViewController: UIViewController {

    
    @IBOutlet weak var collectionview: UICollectionView!
    var havuzdetay=[information_pool_detay]()
    var informayionpool_Id:String="";
    override func viewDidLoad() {
        super.viewDidLoad()
        print("gelen id degeri \(informayionpool_Id)")
        pooldetay()
        collectionview.dataSource = self as? UICollectionViewDataSource
            collectionview.delegate = self as? UICollectionViewDelegate
        // Do any additional setup after loading the view.
    }
    

    func pooldetay(){
    print("fonksiyon içi detay")
         let urlString = "\(API_URL)/get_information_pool_details.php"
         let url: NSURL = NSURL(string: urlString)!
         let sessions = URLSession.shared
         let request = NSMutableURLRequest(url: url as URL)
         request.httpMethod = "POST"
     
         
        
         let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
         let paramI = "I".base64Encoded()
       var customerıd="12"
       var information_pool_id = informayionpool_Id
       var device_type = ""
       information_pool_id = information_pool_id.base64Encoded()!
      
       device_type = device_type.base64Encoded()!
       customerıd = customerıd.base64Encoded()!
       
     
         
       let paramString = "param1=\(customerıd~?)&param2=\(information_pool_id~?)&param3=\(paramLanguageID~?)&param4=\(device_type~?)"
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
                            print("part1 degeri bilgi detay \(result)")
                            let cardview = xmlPath1?.components(separatedBy: "[#]")
                           
                             
                          
                          //  for i in 0..<Int(cardview!.count){
                                
                                
                            //   let cardview1 = cardview?[i].components(separatedBy: "[#]")
                                let pooldetaylist = information_pool_detay()
                                pooldetaylist.Id=String((cardview?[0])!)
                                pooldetaylist.name=String((cardview?[1])!)
                                pooldetaylist.image=String((cardview?[2])!)
                                pooldetaylist.email=String((cardview?[3])!)
                                pooldetaylist.phone=String((cardview?[4])!)
                                pooldetaylist.regions=String((cardview?[5])!)
                                pooldetaylist.desc=String((cardview?[6])!)
                                pooldetaylist.skill=String((cardview?[7])!)
                                pooldetaylist.added_date=String((cardview?[8])!)
                                  
                           

                                self.havuzdetay.append(pooldetaylist);
                                
                                
                           // }
                       
//                            print("yeni gelen deger \(self.havuzdetay[1].name)")
                            self.collectionview.reloadData()
                        
                     
                         }
                     
                     }
                 }
             }
         }
         task.resume()
       
     }
    
    

}
extension BilgiHavuzuDetayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
  
    // MARK: UICollectionViewDataSource

   func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       //kaç kere tekrarlanıcanı söylüyor.
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bilgihavuzudetayCell", for: indexPath) as? BilgiHavuzuDeatayCollectionViewCell
    
        // Configure the cell
      //  let rowNumber = indexPath.row;
        // let article = cardviewmodel[indexPath.row]
       
         //  let article = yayinlarmodel[indexPath.row]
       
      //  cell?.lbl_title.text = article.title
      // cell?.image.Load(url: article.image)
        print("gelen deger \(havuzdetay[0].name)")
        cell?.lbl_name.text=havuzdetay[0].name
        cell?.lbl_acıklama.text=havuzdetay[0].desc
        cell?.lbl_tarih.text=havuzdetay[0].added_date
        cell?.frame_view.layer.cornerRadius=15
        cell?.frame_view.layer.borderWidth=2
        cell?.frame_view.layer.borderColor=UIColor.red.cgColor
    
     //  cell?.layer.borderColor = UIColor.white.cgColor;
      // cell?.layer.borderWidth = 1;
      
       
     /*  cell!.collectioncell.layer.cornerRadius=5
              cell!.collectioncell.layer.borderWidth=2
       cell!.collectioncell.layer.borderColor=UIColor(red:43.0/255.0, green:147.0/255.0, blue:6.0/255.0, alpha: 0.4).cgColor*/
             
        print("cell içi")
       return cell!
    }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    
    
    let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
  
    let vc = storyboard.instantiateViewController(withIdentifier: "bilgikisiStoryboard") as! BilgiHavuzKisiViewController
    vc.name = havuzdetay[0].name
    vc.email = havuzdetay[0].email
    vc.phone = havuzdetay[0].phone
    vc.regions = havuzdetay[0].regions
    vc.desc = havuzdetay[0].desc
    vc.skill = havuzdetay[0].skill
     self.present(vc, animated: true, completion: nil)
   
   }
    
}






extension BilgiHavuzuDetayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let bounds = collectionView.bounds
        // let width = self.view.frame.width - 16.0 * 2
              // let height: CGFloat = 234.0
               
       return CGSize(width: bounds.width-10, height: bounds.height/2)
    }
}
