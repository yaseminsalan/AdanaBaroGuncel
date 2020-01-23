//
//  YayinlarPdfViewController.swift
//  AdanaBaro
//
//  Created by yasemin salan on 23.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import PDFReader
import PDFKit

class YayinlarPdfViewController: UIViewController {

    var pdf_url:String="";
    @IBAction func btn_paylas(_ sender: Any) {
    }
    @IBOutlet weak var pdfView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
   // ...

      // Add PDFView to view controller.
      let pdfView = PDFView(frame: self.view.bounds)
      pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      self.pdfView.addSubview(pdfView)
      
      // Fit content in PDFView.
      pdfView.autoScales = true
      
      // Load Sample.pdf file from app bundle.
          let url = URL(string: pdf_url)
      
        print("url degeri \(url)")
      pdfView.document = PDFDocument(url: url!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
     /// Initializes a document with the name of the pdf in the file system
    
}
