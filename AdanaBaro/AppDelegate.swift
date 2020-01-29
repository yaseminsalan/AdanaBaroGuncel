//
//  AppDelegate.swift
//  AdanaBaro
//
//  Created by Yasemin salan on 14.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import SideMenuSwift

let API_URL = "http://limonistcrm.com/ADANABAROSU/mobil"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var saveDevice = ""
          var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Override point for customization after application launch.
               // iOS 10 support
                     if #available(iOS 10, *) {
                         UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
                         application.registerForRemoteNotifications()
                     }
                     else if #available(iOS 9, *) {
                             // iOS 9 support
                         UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
                         UIApplication.shared.registerForRemoteNotifications()
                     }
                     else if #available(iOS 8, *) {
                           // iOS 8 support
                         UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
                         UIApplication.shared.registerForRemoteNotifications()
                     }
                     else {
                         // iOS 7 support
                         application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
                     }
                  
                                   SideMenuController.preferences.basic.menuWidth = 300
                                   SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
                                   SideMenuController.preferences.basic.enablePanGesture = true
                                   SideMenuController.preferences.basic.supportedOrientations = .portrait
                   //  KeyboardDismisser.shared.attach()
        sleep(2)
               
               return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
               let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
               print("\n\ndeviceToken: \(token) \n\n")
               saveDevice = "\(token)"
               AppDelegate.setUserDefaults(saveDevice, key: "DEVICE_TOKEN_ID")
           }
        // Encode
           class func encode(asBase64 encodeData: String?) -> String? {
               if encodeData == nil {
                   return ""
               }
               //Create NSData object
               let dataToEncode: Data? = encodeData?.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
               // Get NSString from NSData object in Base64
               let encodedData = dataToEncode?.base64EncodedString(options: [])
               return encodedData
           }
        //DECODED DATA with KEY
        class func decode(asBase64 decodeData: String?) -> String? {
            if decodeData == nil {
                return ""
            }
            // NSData from the Base64 encoded str
            let dataToDecode = Data(base64Encoded: decodeData ?? "", options: [])
            // Decoded NSString from the NSData
            var decodedData: String? = nil
            if let aDecode = dataToDecode {
                decodedData = String(data: aDecode, encoding: .utf8)
            }
            return decodedData
        }
        
        class func setUserDefaults(_ value: String?, key: String?) {
            let defs = UserDefaults.standard
            defs.set(value, forKey: key ?? "")
            defs.synchronize()
        }
        @objc public static func getUserDefaults(_ key: String?) -> String? {
               //KEYS: callPhone, sendMail
               let defs = UserDefaults.standard
               return defs.object(forKey: key ?? "") as? String
           }
        class func getDeviceLanguageId() -> String? {
               let language = NSLocale.preferredLanguages.first
               if Int((language as NSString?)?.range(of: "tr").location ?? 0) == NSNotFound || Int((language as NSString?)?.range(of: "TR").location ?? 0) == NSNotFound || Int((language as NSString?)?.range(of: "tr-TR").location ?? 0) == NSNotFound {
                   return "2"
               } else {
                   return "1"
               }
           }
        class func getModel() -> String? {
              var systemInfo = utsname()
              uname(&systemInfo)
              
              let str = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
                  return String(cString: ptr)
              }
              return str
          }
        
       class func getConnectionErrorMessage() -> String? {
           let txtMessage = "Bağlantı hatası. Veriler düzgün yüklenmedi. Lütfen tekrar deneyiniz."
           return txtMessage
       }
       
       class func getMessageForNoItem() -> String? {
           let txtMessage = "BİLGİ YOK"
           return txtMessage
       }


    }

    // MARK : - BASE64 ILE SIFRELEME & SIFRE COZME METHODLARI
    extension String {
        func base64Encoded() -> String? {
            return data(using: .utf8)?.base64EncodedString()
        }
        
        func base64Decoded() -> String? {
            var st = self;
            if (self.count % 4 <= 2){
                st += String(repeating: "=", count: (self.count % 4))
            }
            guard let data = Data(base64Encoded: st) else { return nil }
            return String(data: data, encoding: .utf8)
        }
    }
    // MARK : - STRINGLERIN BASINDAKI OPTIONAL YAZISININ GIDERILMESINE DAIR METHOD
    fileprivate protocol _Optional {
        func unwrappedString() -> String
    }
    extension Optional: _Optional {
        fileprivate func unwrappedString() -> String {
            switch self {
            case .some(let wrapped as _Optional): return wrapped.unwrappedString()
            case .some(let wrapped): return String(describing: wrapped)
            case .none: return String(describing: self)
            }
        }
    }
    postfix operator ~?
    public postfix func ~? <X> (x: X?) -> String {
        return x.unwrappedString()
    }

    // MARK : - Custom UIColor
    extension UIColor {
        struct bestColor {
            static let modernRed = UIColor(red:0.99, green:0.24, blue:0.22, alpha:1.0)
            static let modernBlue = UIColor(red:0.09, green:0.51, blue:0.98, alpha:1.0)
            static let modernGreen = UIColor(red:0.13, green:0.33, blue:0.05, alpha:1.0)
        }
    }



