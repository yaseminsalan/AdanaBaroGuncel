//
//  YayinlarPageViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 22.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash

class YayinlarPageViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    var yayinid:String="";
        var yayinlarmodel=[yayinlar]()
    override func viewDidLoad() {
        super.viewDidLoad()
        yayinlarpage()
        
        collectionview.dataSource = self as? UICollectionViewDataSource
        collectionview.delegate = self as? UICollectionViewDelegate
        // Do any additional setup after loading the view.
    }
    
    func yayinlarpage(){
           print("fonksiyon içi")
                let urlString = "\(API_URL)/get_publicaitons.php"
                let url: NSURL = NSURL(string: urlString)!
                let sessions = URLSession.shared
                let request = NSMutableURLRequest(url: url as URL)
                request.httpMethod = "POST"
            
                
               
                let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
                let paramI = "I".base64Encoded()
              var customerıd="12"
              var parent_id = ""
              var device_type = ""
              parent_id = parent_id.base64Encoded()!
             
              device_type = device_type.base64Encoded()!
              customerıd = customerıd.base64Encoded()!
              
            
                
              let paramString = "param1=\(customerıd~?)&param2=\(parent_id~?)&param3=\(paramLanguageID~?)&param4=\(device_type~?)"
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
                                       let yayinlarlist=yayinlar()
                                       yayinlarlist.Id=String((cardview1?[0])!)
                                      yayinlarlist.title = String((cardview1?[1])!)
                                       yayinlarlist.image = String((cardview1?[2])!)
                                      

                                       self.yayinlarmodel.append(yayinlarlist);
                                       
                                       
                                   }
                                  print("dizi içi\(self.yayinlarmodel[0].title)")
                                    print("dizi içi1\(self.yayinlarmodel[1].title)")
                                   
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

    extension YayinlarPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        
      
        // MARK: UICollectionViewDataSource

       func numberOfSections(in collectionView: UICollectionView) -> Int {
            // #warning Incomplete implementation, return the number of sections
           //kaç kere tekrarlanıcanı söylüyor.
            return 1
        }


        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return yayinlarmodel.count;
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yayinlarCell", for: indexPath) as? YayinlarPageCollectionViewCell
        
            // Configure the cell
          //  let rowNumber = indexPath.row;
            // let article = cardviewmodel[indexPath.row]
           
               let article = yayinlarmodel[indexPath.row]
           
            cell?.lbl_title.text = article.title
           cell?.image.Load(url: article.image)
           
        
           cell?.layer.borderColor = UIColor.white.cgColor;
          // cell?.layer.borderWidth = 1;
          
           
         /*  cell!.collectioncell.layer.cornerRadius=5
                  cell!.collectioncell.layer.borderWidth=2
           cell!.collectioncell.layer.borderColor=UIColor(red:43.0/255.0, green:147.0/255.0, blue:6.0/255.0, alpha: 0.4).cgColor*/
                 
            print("cell içi")
           return cell!
        }
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // let article = yayinlarmodel[indexPath.row]
      // var storyboardControl = article.prepare_segue
       yayinid = yayinlarmodel[indexPath.row].Id
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      
        let vc = storyboard.instantiateViewController(withIdentifier: "yayindetayStoryboard") as! YayinlarDetayTableViewController
          vc.yayinId = yayinid
         self.present(vc, animated: true, completion: nil)
       // print("ıd degeri \(yayinId)")
       /* print("celle tıklandı \(storyboardControl)")
       if storyboardControl == "SEQUEFORBAROCONTACT"{
            let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "BaroContactStoryboard") as! BaroContactTableViewController
             self.present(vc, animated: true, completion: nil)
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
          }*/
       }
        
    }






    extension YayinlarPageViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let bounds = collectionView.bounds
            // let width = self.view.frame.width - 16.0 * 2
                  // let height: CGFloat = 234.0
                   
           return CGSize(width: bounds.width-10, height: bounds.height/2)
        }
    }
