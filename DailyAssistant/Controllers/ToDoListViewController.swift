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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(newReminder))
        self.view.backgroundColor = .green
        setUpTextViews()
        toDoListView.newItemTextView.becomeFirstResponder()
        toDoListView.addNoteButton.addTarget(self, action: #selector(addNewNote), for: .touchUpInside)
    }
    @objc private func addNewNote(button: UIBarButtonItem) -> Void {
        guard let itemTitle = toDoListView.newItemTextView.text else {
            fatalError("text field nil")
        }
        
        
        
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
        let toDo = ToDo.init(title: itemTitle, createdAt: timestamp)
        
        ToDosModel.addItem(item: toDo)
        navigationController?.popViewController(animated: true)
        
        button.isEnabled = true
    }
    private func setUpTextViews(){
        toDoListView.newItemTextView.delegate = self
        toDoListView.newItemTextView.text = placeholderText
        toDoListView.newItemTextView.textColor = .lightGray
        toDoListView.newItemTextView.font = UIFont(name: "thonburi", size: 22)
    }
    
    @objc private func newReminder(button: UIBarButtonItem) -> Void {
        guard let itemTitle = toDoListView.newItemTextView.text else {
            fatalError("text field is nil")
        }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
      let eventData = EventsData.init(description: itemTitle, createdAt: timestamp)
        
        EventsDataModel.addEvent(event: eventData)
        dismiss(animated: true, completion: nil)
        button.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if textView.text == placeholderText {
//            textView.text = ""
//        }
//        return true
//    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = placeholderText
//        }
    }
    
extension ToDoListViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if toDoListView.newItemTextView.text == placeholderText {
            textView.text = ""
            textView.textColor = .black
        }

    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            if textView == toDoListView.newItemTextView {
                textView.text = placeholderText
                textView.textColor = .lightGray
            } else if textView == toDoListView.newItemTextView {
                textView.text = placeholderText
                textView.textColor = .lightGray
            }
        }
    }
    
    
    
}
