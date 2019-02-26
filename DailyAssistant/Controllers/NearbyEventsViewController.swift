//
//  NearbyEventsViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/25/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class NearbyEventsViewController: UIViewController {
    private var events: Event!

    override func viewDidLoad() {
        super.viewDidLoad()
     
    
    }
    
    init(eventsFull: Event) {
   super.init(nibName: nil, bundle: nil)
        self.events = eventsFull
}
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
}
}
