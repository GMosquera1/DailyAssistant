//
//  EventView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import EventKit

class ToDoView: UIView {
    
    public lazy var eventInfoView: UITextView = {
        let infoView = UITextView()
        infoView.text = "hello"
        return infoView
    }()
    public lazy var titleTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.init(name: "thonburi", size: 18)
        return textView
    }()
    public lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
         textView.font = UIFont.init(name: "thonburi", size: 18)
        return textView
    }()
    
    public lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    public lazy var notesField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Event"
        textField.textColor = .black
        textField.font = UIFont.init(name: "thonburi", size: 18)
        return textField
    }()
    
    public lazy var addEventButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add Event", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.titleLabel?.font = UIFont.init(name: "thonburi", size: 18)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        addButton.addTarget(self, action: #selector(addNewEvent), for: .touchUpInside)
        return addButton
    }()
    
    public lazy var swipeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.font = UIFont(name: "thonburi", size: 18)
        label.text = "Swipe to Add Reminder"
        return label
    }()
    
        public lazy var toggles: UIPageControl = {
            let toggle = UIPageControl()
            toggle.isUserInteractionEnabled = true
            toggle.numberOfPages = 2
            toggle.currentPage = 1
            toggle.currentPageIndicatorTintColor = .blue
            toggle.updateCurrentPageDisplay()
            toggle.pageIndicatorTintColor = .lightGray
            return toggle
        }()

//    @objc func addNewEvent(sender: UIButton) {
//        sender.setTitle("Event Added", for: .normal)
//        sender.setTitleColor(.white, for: .normal)
//        let eventStore: EKEventStore = EKEventStore()
//        
//        eventStore.requestAccess(to: .event) {(granted, error) in
//            if (granted) && (error == nil)
//            {
//                print("granted \(granted)")
//                print("error \(error)")
//                
//                let event:EKEvent = EKEvent(eventStore: eventStore)
//                DispatchQueue.main.async {
//                    event.title = self.titleTextView.text
//                }
//                event.startDate = Date()
//                event.endDate = Date()
//                event.notes = "This is a note"
//                event.calendar = eventStore.defaultCalendarForNewEvents
//                do {
//                    try eventStore.save(event, span: .thisEvent)
//                } catch let error as NSError{
//                    print("error: \(error)")
//                }
//                print("Save Event")
//                
//            } else {
//                print("error: \(error)")
//                
//            }
//            
//        }
//        print("pressed")
//    }

    override init(frame: CGRect){ super.init(frame: UIScreen.main.bounds)
        commonInit()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    } 
    private func commonInit(){
        setConstraints()
    }
    
    func setConstraints() {
        
        addSubview(titleTextView)
        addSubview(descriptionTextView)
        addSubview(notesField)
        addSubview(datePicker)
        addSubview(addEventButton)
        addSubview(swipeLabel)
        addSubview(toggles)
        
        
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        notesField.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addEventButton.translatesAutoresizingMaskIntoConstraints = false
        swipeLabel.translatesAutoresizingMaskIntoConstraints = false
        toggles.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),titleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), titleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 18),descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), notesField.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 18),notesField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), notesField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), datePicker.topAnchor.constraint(equalTo: notesField.bottomAnchor, constant: 18), datePicker.trailingAnchor.constraint(equalTo: trailingAnchor), datePicker.leadingAnchor.constraint(equalTo: leadingAnchor), addEventButton.bottomAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 25), addEventButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -170), swipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor), swipeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), swipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), swipeLabel.bottomAnchor.constraint(equalTo: toggles.topAnchor),toggles.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor), toggles.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
    }
}
