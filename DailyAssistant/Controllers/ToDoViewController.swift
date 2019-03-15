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
    private var toDo2Placeholder = "Notes"
    
    var myEvents = [Event]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toDoView)
//         setUpTextViews()
        //toDoListView.newItemTextView.delegate = self
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(newEvent))
       self.view.bringSubviewToFront(self.pageControl)
        toDoView.addEventButton.addTarget(self, action: #selector(addNewEvent), for: .touchUpInside)

        toDoView.titleTextView.becomeFirstResponder()
    }
    func createNewEvent(){
    let date = toDoView.datePicker.date.description
     let event = EventsData(description: self.toDoView.notesField.text! , createdAt: date)
        EventsDataModel.addEvent(event: event)
    }
    func addEventToCalendar(date: Date, title: String) {
        let eventStore: EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) {(granted, error) in
            if (granted) && (error == nil)
            {
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                DispatchQueue.main.async {
                    event.title = title
                }
                event.startDate = date
                event.endDate = date
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError{
                    print("error: \(error)")
                }
                //                let
                //                EventsDataModel.addEvent(event: <#T##EventsData#>)
                
            } else {
                print("error: \(error)")
                
            }
            
        }
        print("pressed")
    }
    @objc func addNewEvent(sender: UIButton) {
        sender.setTitle("Event Added", for: .normal)
        sender.setTitleColor(.blue, for: .normal)
        let date = toDoView.datePicker.date
        addEventToCalendar(date: date,title: self.toDoView.notesField.text!)
        createNewEvent()

    }
    private func setUpTextViews() {
        toDoView.titleTextView.delegate = self
        toDoView.descriptionTextView.delegate = self
        toDoView.titleTextView.text = toDoPlaceholder
        toDoView.descriptionTextView.text = toDo2Placeholder
        toDoView.titleTextView.textColor = .lightGray
        toDoView.descriptionTextView.textColor = .lightGray
    }
    
    // TODO doing a cancel programmatically
    
//    @objc private func addNewNote(button: UIBarButtonItem) -> Void {
//        guard let itemTitle = toDoView.titleTextView.text,
//        let itemDescription = toDoView.descriptionTextView.text else {
//            fatalError("text field nil")
//        }
//
//
//
//    let date = Date()
//    let isoDateFormatter = ISO8601DateFormatter()
//    isoDateFormatter.formatOptions = [.withFullDate,
//    .withFullTime,
//    .withInternetDateTime,
//    .withTimeZone,
//    .withDashSeparatorInDate]
//    let timestamp = isoDateFormatter.string(from: date)
//
//        let toDo = ToDo.init(title: itemTitle, description: itemDescription, createdAt: timestamp)
//
//        ToDosModel.addItem(item: toDo)
//        dismiss(animated: true, completion: nil)
//
//          button.isEnabled = true
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension ToDoViewController: UIPageViewControllerDelegate {
    
}

extension ToDoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if toDoView.titleTextView.text == toDoPlaceholder {
            textView.text = ""
            textView.textColor = .black
        }
        if toDoView.descriptionTextView.text == toDo2Placeholder {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            if textView == toDoView.titleTextView {
                if textView == toDoView.titleTextView {
                    textView.text = toDoPlaceholder
                    textView.textColor = .lightGray
                }
                
            }
        }
    }
}
