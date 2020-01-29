//
//  BaroRehberViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 21.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash
class BaroRehberViewController: UIViewController {
var scroolview=UIScrollView()
    
     var rehbermodel=[rehber]()
     var rehbermodeltip=[rehber]()
    var rehbermodelbirim = [rehber]()
     var birimtipdeger:String="";
    var birimdeger:String="";
    var aramadeger:String="";
    var tapCardChoose=true
      var tapAddressChoose=true
    @IBOutlet weak var btn_adliye: UIButton!
    
    @IBAction func btn_adliye(_ sender: Any) {
        
        
           let y = btn_adliye.frame.origin.y+btn_adliye.frame.size.height
        
         if tapAddressChoose{
             showScroolAdliye(x:10, y: Int(y), width: Int(view.frame.width-20), list: rehbermodel)
             tapAddressChoose=false
             tapCardChoose=false
         }
         
         else{
             scroolview.isHidden=true
             tapAddressChoose=true
             tapCardChoose=true
             }
    }
    func showScroolAdliye(x:Int,y:Int,width:Int,list:[rehber]){
        scroolview=UIScrollView()
        scroolview.isHidden=false
         scroolview.layer.cornerRadius = 7
        scroolview.frame=CGRect(x: x+130, y: y+95, width: width-150, height: list.count*60)
        scroolview.contentSize=CGSize(width: width, height: list.count*60)
        scroolview.backgroundColor=UIColor.white
        scroolview.isScrollEnabled=true
        for i in 0..<list.count{
            
            let button = UIButton()
            button.frame=CGRect(x: x, y:10+(i*55), width: width-170, height: 50)
            button.setTitle(String(rehbermodel[i].title), for: .normal)
            button.setTitleColor(.black, for: .normal)
            //button.titleLabel?.font = UIFont(name: YourfontName, size: 20)
            button.titleLabel?.font = .systemFont(ofSize: 14)
          
            button.addTarget(self, action: #selector(tapAdliyeButton(_:)), for: .touchUpInside)
            button.tag=Int(rehbermodel[i].Id)!
            button.backgroundColor=UIColor.white
            button.layer.cornerRadius=5
            scroolview.addSubview(button)
        }
        
      
        
        self.view.addSubview(scroolview)
    }
    
    @objc func tapAdliyeButton(_ sender: UIButton){
         
         for i in 0..<rehbermodel.count{
             
             if Int(rehbermodel[i].Id)==sender.tag{
                 scroolview.isHidden=true
                
                // btn_teslimat.setTitle(addressList[i].Title, for: .normal)
                 self.tapAddressChoose=true
                 self.tapCardChoose=true
                 //selectedaddress=String(rehbermodel[i].id)
                 //print("son adres  \(selectedaddress)");
                // lblteslimat.text=String(rehbermodel[i].Title)
              //lblteslimat.tag=teslimatList[i].id
               // btn_adliye.t
                btn_adliye.setTitleColor(.black, for: .normal)
                         btn_adliye.setTitle("    "+rehbermodel[i].title, for: UIControl.State.normal)
                        // btn_adliye.tag = Int(rehbermodel[i].Id)
                         birimtipdeger = rehbermodel[i].Id
                     BaroRehberbirimT()
             
             }
             
         }
             
         }
    
    @IBOutlet weak var btn_birimtipi: UIButton!
    @IBAction func btn_birimtipi(_ sender: Any) {
      
        
        print("deneme ıd \(birimtipdeger)")
            
          
            
            let y = btn_birimtipi.frame.origin.y+btn_birimtipi.frame.size.height
                   
                    if tapAddressChoose{
                        showScroolbirimtip(x:10, y: Int(y), width: Int(view.frame.width-20), list: rehbermodeltip)
                        tapAddressChoose=false
                        tapCardChoose=false
                    }
                    
                    else{
                        scroolview.isHidden=true
                        tapAddressChoose=true
                        tapCardChoose=true
                        }
      
    }
    func showScroolbirimtip(x:Int,y:Int,width:Int,list:[rehber]){
        scroolview=UIScrollView()
        scroolview.isHidden=false
        scroolview.layer.cornerRadius = 7
        scroolview.frame=CGRect(x: x+130, y: y+95, width: width-150, height: list.count*60)
        scroolview.contentSize=CGSize(width: width, height: list.count*60)
        scroolview.backgroundColor=UIColor.white
        scroolview.isScrollEnabled=true
        for i in 0..<list.count{
            
            let button = UIButton()
            button.frame=CGRect(x: x, y:10+(i*55), width: width-170, height: 50)
            button.setTitle(String(rehbermodeltip[i].title), for: .normal)
            button.setTitleColor(.black, for: .normal)
          //button.titleLabel?.font = UIFont(name: YourfontName, size: 20)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(tapBirimTipButton(_:)), for: .touchUpInside)
            button.tag=Int(rehbermodeltip[i].Id)!
            button.backgroundColor=UIColor.white
            button.layer.cornerRadius=5
            scroolview.addSubview(button)
        }
        
      
        
        self.view.addSubview(scroolview)
    }
    @objc func tapBirimTipButton(_ sender: UIButton){
     
      for i in 0..<rehbermodeltip.count{
          
          if Int(rehbermodeltip[i].Id)==sender.tag{
              scroolview.isHidden=true
             
             // btn_teslimat.setTitle(addressList[i].Title, for: .normal)
              self.tapAddressChoose=true
              self.tapCardChoose=true
              //selectedaddress=String(rehbermodel[i].id)
              //print("son adres  \(selectedaddress)");
             // lblteslimat.text=String(rehbermodel[i].Title)
           //lblteslimat.tag=teslimatList[i].id
            // btn_adliye.t
               
               btn_birimtipi.setTitleColor(.black, for: .normal)
              btn_birimtipi.setTitle("    "+rehbermodeltip[i].title, for: UIControl.State.normal)
                                     // btn_adliye.tag = Int(rehbermodel[i].Id)
              birimdeger = rehbermodeltip[i].Id
             BaroRehberbirim()
           
          
          }
          
      }
          
      }
    
    
    @IBAction func bnt_birim(_ sender: Any) {
        
        
                 let y = btn_birim.frame.origin.y+btn_birim.frame.size.height
                        
                         if tapAddressChoose{
                             showScroolbirim(x:10, y: Int(y), width: Int(view.frame.width-20), list: rehbermodelbirim)
                             tapAddressChoose=false
                             tapCardChoose=false
                         }
                         
                         else{
                             scroolview.isHidden=true
                             tapAddressChoose=true
                             tapCardChoose=true
                             }
        
    }
    func showScroolbirim(x:Int,y:Int,width:Int,list:[rehber]){
           scroolview=UIScrollView()
           scroolview.isHidden=false
           scroolview.layer.cornerRadius = 7
           scroolview.frame=CGRect(x: x+130, y: y+95, width: width-150, height: list.count*60)
           scroolview.contentSize=CGSize(width: width, height: list.count*60)
           scroolview.backgroundColor=UIColor.white
           scroolview.isScrollEnabled=true
           for i in 0..<list.count{
               
               let button = UIButton()
               button.frame=CGRect(x: x, y:10+(i*55), width: width-170, height: 50)
               button.setTitle(String(rehbermodelbirim[i].title), for: .normal)
               button.setTitleColor(.black, for: .normal)
             //button.titleLabel?.font = UIFont(name: YourfontName, size: 20)
               button.titleLabel?.font = .systemFont(ofSize: 14)
               button.addTarget(self, action: #selector(tapBirimButton(_:)), for: .touchUpInside)
               button.tag=Int(rehbermodelbirim[i].Id)!
               button.backgroundColor=UIColor.white
               button.layer.cornerRadius=5
               scroolview.addSubview(button)
           }
           
         
           
           self.view.addSubview(scroolview)
       }
    @objc func tapBirimButton(_ sender: UIButton){
        
         for i in 0..<rehbermodelbirim.count{
             
             if Int(rehbermodelbirim[i].Id)==sender.tag{
                 scroolview.isHidden=true
                
                // btn_teslimat.setTitle(addressList[i].Title, for: .normal)
                 self.tapAddressChoose=true
                 self.tapCardChoose=true
                 //selectedaddress=String(rehbermodel[i].id)
                 //print("son adres  \(selectedaddress)");
                // lblteslimat.text=String(rehbermodel[i].Title)
              //lblteslimat.tag=teslimatList[i].id
               // btn_adliye.t
                  
                  btn_birimtipi.setTitleColor(.black, for: .normal)
                 btn_birim.setTitle("    "+rehbermodelbirim[i].title, for: UIControl.State.normal)
                                        // btn_adliye.tag = Int(rehbermodel[i].Id)
                aramadeger = rehbermodelbirim[i].Id
             
             
             }
             
         }
             
         }
    
    @IBOutlet weak var btn_birim: UIButton!
    
    
    @IBAction func btn_ara(_ sender: Any) {
        
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AraStoryboard") as! BaroRehberAraTableViewController
        vc.aramadeger = aramadeger
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     BaroRehber()
      
       // BaroRehberbirimT()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
                  super.viewWillAppear(animated)
              
                
             }
    func BaroRehber(){
    print("fonksiyon içi")
         let urlString = "\(API_URL)/get_courthouses_and_units_types.php"
         let url: NSURL = NSURL(string: urlString)!
         let sessions = URLSession.shared
         let request = NSMutableURLRequest(url: url as URL)
         request.httpMethod = "POST"
     
         
        
        let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
        let paramI = "I".base64Encoded()
       var customerıd="12"
       var unit_level = "0"
       var related_id = "0"
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
                                let barorehberi = rehber()
                                barorehberi.Id = String((cardview1?[0])!)
                                barorehberi.title = String((cardview1?[1])!)
                              

                                self.rehbermodel.append(barorehberi);
                                
                                
                            }
                        print("dizi içi\(self.rehbermodel[0].title)")
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func BaroRehberbirimT(){
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
          var unit_level = "1"
          var related_id = birimtipdeger
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
                          
                            if xmlPath1 == nil{
                               print("dönüş değeri boş")
                             //   SVProgressHUD.dismiss()
                              //  AppDelegate.showAlertError(AppDelegate.getConnectionErrorMessage())
                            }
                            else {
                                let result = xmlPath1
                               print("part1 degeri birim tipi \(result)")
                               let cardview = xmlPath1?.components(separatedBy: "[##]")
                               print("donüş değeri \(cardview?.count)")
                                
                             
                               for i in 0..<Int(cardview!.count){
                                   
                                   
                                  let cardview1 = cardview?[i].components(separatedBy: "[#]")
                                   let barorehberi = rehber()
                                   barorehberi.Id = String((cardview1?[0])!)
                                   barorehberi.title = String((cardview1?[1])!)
                                 

                                   self.rehbermodeltip.append(barorehberi);
                                   
                                   
                               }
                           print("dizi içi tip birimi\(self.rehbermodeltip[0].title)")
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
          var unit_level = "2"
          var related_id = birimdeger
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
                          
                            if xmlPath1 == nil{
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
    
}
