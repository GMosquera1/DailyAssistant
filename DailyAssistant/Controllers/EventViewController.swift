//
//  ViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/6/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    let eventView = EventView()
    
    var myEvents = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    view.addSubview(eventView)
  
    }

//    func dumpData() {
//        EventbriteAPIClient.getEvent(keyword: "yoga"){ (appError, event) in
//            if let appError = appError {
//                print(appError)
//            }else if let events = event {
//                self.myEvents = events
//                dump(self.myEvents)
//            }
//        }
//    }

}

