//
//  HomePageViewController.swift
//  AdanaBaro
//
//  Created by İsmail ÜNAL on 16.01.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import FSCalendar
public protocol DateSelectDelegate: NSObjectProtocol {
    func selectDate(_ date: Date) -> Void
}

class HomePageViewController: UIViewController {
    
    fileprivate weak var calendar: FSCalendar!
    open weak var delegate: DateSelectDelegate?
      fileprivate var selectedDate: Date?

    @IBOutlet weak var fsCalendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    

}

