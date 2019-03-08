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
    
    private var toDoPlaceholder = "Title"
    
    var myEvents = [Event]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toDoView)
        //toDoListView.newItemTextView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(newEvent))
       self.view.bringSubviewToFront(self.pageControl)
        //checkinonthis
//         toDoView.toggles.updateCurrentPageDisplay()
    }
    
    @objc private func newEvent(button: UIBarButtonItem) -> Void {
//        guard let itemTitle = toDoPlaceholder else {
//            fatalError("text field nil")
        
        button.isEnabled = true 
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension ToDoViewController: UIPageViewControllerDelegate {
    
}

