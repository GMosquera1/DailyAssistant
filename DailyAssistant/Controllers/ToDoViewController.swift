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
    
    var myEvents = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toDoView)
//        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(back))
//        self.navigationItem.leftBarButtonItem = backButton
//        self.navigationItem.title = "Hi Genesis"
        //setUp()
    }
//
//    @objc private func back(button: UIBarButtonItem) -> Void {
//        button.isEnabled = true
//      var overviewController = OverviewController()
//        navigationController?.pushViewController(overviewController, animated: true)
//      present(overviewController, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
       
   // }
//    func setUp(){
//        self.navigationItem.title = "Create an Event"
//        navigationController?.navigationBar.barTintColor = UIColor.red
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)]
//
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

