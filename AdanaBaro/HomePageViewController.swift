//
//  HomePageViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 16.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import FSCalendar
import SWXMLHash
public protocol DateSelectDelegate: NSObjectProtocol {
    func selectDate(_ date: Date) -> Void
}
//Bu zorunluluk
private let reuseIdentifier = "PeopleCell";
class HomePageViewController: UIViewController {
     var cardviewmodel=[cartview]()
     let yourColor : UIColor = UIColor( red: 43/255, green: 147/255, blue:6/255, alpha: 1 )
    
      
    @IBOutlet weak var collectionview: UICollectionView!
    fileprivate weak var calendar: FSCalendar!
    open weak var delegate: DateSelectDelegate?
      fileprivate var selectedDate: Date?

    @IBOutlet weak var fsCalendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        homapage()
        
        collectionview.backgroundColor = UIColor(white: 1, alpha: 0.0)
        collectionview.dataSource = self as? UICollectionViewDataSource
        collectionview.delegate = self as? UICollectionViewDelegate
        // Do any additional setup after loading the view, typically from a nib.
        
               self.fsCalendar.locale = Locale(identifier: "en_US")
          
               self.fsCalendar.firstWeekday = 1
               //        self.fsCalender.identifier = FSCalendarDefaultCellReuseIdentifier
               self.fsCalendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesSingleUpperCase]
               //        self.fsCalender.collectionViewLayout.sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
               //        self.fsCalender.appearance.borderRadius = 0
              // self.updateLabel(Date())
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func homapage(){
     print("fonksiyon içi")
          let urlString = "\(API_URL)/init_scr.php"
          let url: NSURL = NSURL(string: urlString)!
          let sessions = URLSession.shared
          let request = NSMutableURLRequest(url: url as URL)
          request.httpMethod = "POST"
      
          
         
          let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
          let paramI = "I".base64Encoded()
        var customerıd="12"
        var device_token_id = ""
        var device_open_udid = ""
        var app_version_number = ""
        var app_language_id  = ""
        var device_type = ""
        device_token_id = device_token_id.base64Encoded()!
        device_open_udid = device_open_udid.base64Encoded()!
        app_version_number = app_version_number.base64Encoded()!
        device_type = device_type.base64Encoded()!
        customerıd = customerıd.base64Encoded()!
        
      
          
        let paramString = "param1=\(customerıd~?)&param2=\(device_token_id~?)&param3=\(device_open_udid~?)&param4=\(app_version_number~?)&param5=\(paramLanguageID~?)&param6=\(device_type~?)"
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
                                 let cardviewlist=cartview()
                                 cardviewlist.cartviewId=String((cardview1?[0])!)
                                cardviewlist.title = String((cardview1?[1])!)
                                 cardviewlist.image = String((cardview1?[2])!)
                                cardviewlist.prepare_segue = String((cardview1?[3])!)
                                 cardviewlist.account_status = String((cardview1?[4])!)
                                cardviewlist.badge_status = String((cardview1?[5])!)

                                 self.cardviewmodel.append(cardviewlist);
                                 
                                 
                             }
                            print("dizi içi\(self.cardviewmodel[0].title)")
                              print("dizi içi1\(self.cardviewmodel[1].title)")
                              print("dizi içi2\(self.cardviewmodel[2].title)")
                            self.collectionview.reloadData()
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

 extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
     
   
     // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
         // #warning Incomplete implementation, return the number of sections
        //kaç kere tekrarlanıcanı söylüyor.
         return 1
     }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of items
         return cardviewmodel.count;
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleCell", for: indexPath) as? HomePageCollectionViewCell
     
         // Configure the cell
       //  let rowNumber = indexPath.row;
         // let article = cardviewmodel[indexPath.row]
        
            let article = cardviewmodel[indexPath.row]
        
        cell?.lbl_name.text = article.title
        cell?.image.Load(url: article.image)
        
     
        cell?.layer.borderColor = UIColor.white.cgColor;
       // cell?.layer.borderWidth = 1;
       
        
        cell!.collectioncell.layer.cornerRadius=5
               cell!.collectioncell.layer.borderWidth=2
        cell!.collectioncell.layer.borderColor=UIColor(red:43.0/255.0, green:147.0/255.0, blue:6.0/255.0, alpha: 0.4).cgColor
              
         print("cell içi")
        return cell!
     }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let article = cardviewmodel[indexPath.row]
    var storyboardControl = article.prepare_segue
     print("celle tıklandı \(storyboardControl)")
    if storyboardControl == "SEQUEFORBAROCONTACT"{
         print("baro iletişim")
    }
    else if storyboardControl == "SEQUEFORCOURTHOUSEGUIDE"{
         print("adliye rehberi")
    }
   
    else if storyboardControl == "SEQUEFORBAROSIGN"{
            print("baro levha")
       }
    else if storyboardControl == "SEQUEFORBAREXCUSEDJUDGES"{
            print("mazeretli hakimler")
       }
    else if storyboardControl == "SEQUEFORINFORMATIONPOOL"{
            print("bilgi havuzu")
       }
    else if storyboardControl == "SEQUEFORPUBLICATIONS"{
            print("yayınlar")
       }
    }
     
 }






 extension HomePageViewController: UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
         // let width = self.view.frame.width - 16.0 * 2
               // let height: CGFloat = 234.0
                
        return CGSize(width: bounds.width/3-10, height: bounds.height/4)
     }
 }





