//
//  WeatherDetailsViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/5/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import EventKit

class ToDoListViewController: UIViewController {

    let toDoListView = ToDoListView()
    
    let placeholderText = "Enter reminder(s)"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toDoListView)
        self.view.backgroundColor = .green

//        toDoListView.newItemTextView.delegate = self
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text == placeholderText {
            textView.text = ""
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
        }
    }


}
