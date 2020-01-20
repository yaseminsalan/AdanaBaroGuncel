//
//  ViewController.swift
//  AdanaBaro
//
//  Created by Yasemin salan on 14.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SWXMLHash

class ViewController: UIViewController,UIScrollViewDelegate {

      var welcome=[introscreen]()
    
    @IBOutlet weak var btn_login: UIButton!
    
    @IBAction func btn_login(_ sender: Any) {
        print("Butona tıklandı")
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
        
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            
            scrollView.delegate = self
        }
    }
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
     var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
       loginMethod()
                //print("aranan değer\(self.pageControl.currentPage)")
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         
    }
    
    func createSlides() -> [Slide] {
 

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
     //slide1.background.Load(url: welcome[0].back_img_urls)
        slide1.labelTitle.text = self.welcome[0].title_text
        slide1.lblcomment.text = self.welcome[0].exp_text
       //slide1.btn_continue.isEnabled=true
        //btn_login.isEnabled=true
       btn_login.isHidden=true
       
     
       
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.background.Load(url: welcome[1].back_img_urls)
        slide2.labelTitle.text = self.welcome[1].title_text
        slide2.lblcomment.text = self.welcome[1].exp_text
        btn_login.isHidden=false
     //    slide2.btn_continue.isEnabled=true
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.background.Load(url: welcome[2].back_img_urls)
        slide3.labelTitle.text = self.welcome[2].title_text
        slide3.lblcomment.text = self.welcome[2].exp_text
        
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
              slide4.background.Load(url: welcome[3].back_img_urls)
               slide4.labelTitle.text = self.welcome[3].title_text
               slide4.lblcomment.text = self.welcome[3].exp_text
    
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
               slide5.background.Load(url: welcome[4].back_img_urls)
               slide5.labelTitle.text = self.welcome[4].title_text
               slide5.lblcomment.text = self.welcome[4].exp_text
      /*  let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
               self.present(vc, animated: true, completion: nil)*/
        
        
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
   
    
   func butonatıklama(){
        let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
   
       
    func setupSlideScrollView(slides : [Slide]) {
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slides[i])
            }
        }
        
        
        /*
         * default function called when view is scolled. In order to enable callback
         * when scrollview is scrolled, the below code needs to be called:
         * slideScrollView.delegate = self or
         */
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y-50
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
    //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
            /*
             * below code scales the imageview on paging the scrollview
             */
        /*    let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
                
                slides[0].imageview.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                slides[1].imageview.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
                slides[1].imageview.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
                slides[2].imageview.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
                
            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
                slides[2].imageview.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
                
                
            } */
        }
        
        
        
        
        func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
            if(pageControl.currentPage == 0) {
                //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
                //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
                //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
                
                let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.pageIndicatorTintColor = pageUnselectedColor
            
                
                let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                slides[pageControl.currentPage].backgroundColor = bgColor
                
                let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.currentPageIndicatorTintColor = pageSelectedColor
            }
        }
        
        
        func fade(fromRed: CGFloat,
                  fromGreen: CGFloat,
                  fromBlue: CGFloat,
                  fromAlpha: CGFloat,
                  toRed: CGFloat,
                  toGreen: CGFloat,
                  toBlue: CGFloat,
                  toAlpha: CGFloat,
                  withPercentage percentage: CGFloat) -> UIColor {
            
            let red: CGFloat = (toRed - fromRed) * percentage + fromRed
            let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
            let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
            let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
            
            // return the fade colour
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
    
    

    func loginMethod(){
     print("fonksiyon içi")
          let urlString = "\(API_URL)/get_intro_screen_items.php"
          let url: NSURL = NSURL(string: urlString)!
          let sessions = URLSession.shared
          let request = NSMutableURLRequest(url: url as URL)
          request.httpMethod = "POST"
      
          
         
          let paramLanguageID = AppDelegate.getDeviceLanguageId()?.base64Encoded()
          let paramI = "I".base64Encoded()
          
          let paramString = "param1=\(paramLanguageID~?)&param2=\(paramI~?)"
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
                        
                          print("xml degeri \(xml)")
                          let xmlPath = xml["response"]["rows"]["row"]["part1"].element?.text.base64Decoded()
                         
                          
                          if xmlPath == nil{
                             print("dönüş değeri boş")
                           //   SVProgressHUD.dismiss()
                            //  AppDelegate.showAlertError(AppDelegate.getConnectionErrorMessage())
                          }
                          else {
                              let result = xmlPath
                             print("deger içi \(result)")
                             let userDetail = xmlPath?.components(separatedBy: "[##]")
                             print("donüş değeri \(userDetail?.count)")
                              
                           
                             for i in 0..<Int(userDetail!.count){
                                 
                                 
                                 let userDetail1 = userDetail?[i].components(separatedBy: "[#]")
                                 let welcomelist=introscreen()
                                 welcomelist.title_text=String((userDetail1?[0])!)
                                 welcomelist.exp_text = String((userDetail1?[1])!)
                                 welcomelist.img_url = String((userDetail1?[2])!)
                                 welcomelist.back_img_urls = String((userDetail1?[3])!)

                                 self.welcome.append(welcomelist);
                                 
                                 
                             }
                             print("dizi içi\(self.welcome[0].exp_text)")
                              print("dizi içi1\(self.welcome[1].exp_text)")
                              print("dizi içi2\(self.welcome[2].exp_text)")
                            
                            self.slides = self.createSlides()
                            self.setupSlideScrollView(slides: self.slides)
                                  
                            self.pageControl.numberOfPages = self.slides.count
                            self.pageControl.currentPage = 0
                            self.view.bringSubviewToFront(self.pageControl)
                         
                            
                            
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

extension UIImageView {



    func Load(url:String) {

        let newUrl = URL(string: url)

        DispatchQueue.global().async { [weak self] in

            if let data = try? Data(contentsOf: newUrl!) {

                if let image = UIImage(data: data) {

                    DispatchQueue.main.async {

                        self?.image = image

                    }

                }

            }

        }

    }
}





