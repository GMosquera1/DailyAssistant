//
//  ViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/6/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import EventKit

class ToDoViewController: UIViewController {
    
    let toDoView = ToDoView()
    let pageControl = UIPageControl()
    
    var myEvents = [Event]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toDoView)
      //  toDoView.toggles.updateCurrentPageDisplay() = 
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

