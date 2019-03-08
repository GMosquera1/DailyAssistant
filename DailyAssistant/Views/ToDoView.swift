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
    
    public lazy var eventInfoView: UITextView = {
        let infoView = UITextView()
        infoView.text = "hello"
        return infoView
    }()
    public lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.textColor = .black
        textField.font = UIFont.init(name: "thonburi", size: 18)
        return textField
    }()
    public lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Location"
        textField.textColor = .black
        textField.font = UIFont.init(name: "thonburi", size: 18)
        return textField
    }()
    
    public lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    public lazy var notesField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Notes"
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
        addButton.addTarget(self, action: #selector(addNewEvent), for: .touchUpInside)
        return addButton
    }()
    public lazy var addNoteButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add Note", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.titleLabel?.font = UIFont.init(name: "thonburi", size: 18)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        addButton.addTarget(self, action: #selector(addNewNote), for: .touchUpInside)
        return addButton
    }()
    
    @objc func addNewEvent(sender: UIButton) {
        sender.setTitle("Event Added", for: .normal)
        sender.setTitleColor(.white, for: .normal)
        let eventStore: EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) {(granted, error) in
            if (granted) && (error == nil)
            {
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                DispatchQueue.main.async {
                    event.title = self.titleTextField.text
                }
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "This is a note"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError{
                    print("error: \(error)")
                }
                print("Save Event")
                
            } else {
                print("error: \(error)")
                
            }
            
        }
        print("pressed")
    }
    @objc func addNewNote(sender: UIButton) {
        sender.setTitle("Event Added", for: .normal)
        sender.setTitleColor(.white, for: .normal)
        let eventStore: EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) {(granted, error) in
            if (granted) && (error == nil)
            {
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                DispatchQueue.main.async {
                    event.title = self.titleTextField.text
                }
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "This is a note"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError{
                    print("error: \(error)")
                }
                print("Save Event")
                
            } else {
                print("error: \(error)")
                
            }
            
        }
        print("pressed")
    }
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
        
        addSubview(titleTextField)
        addSubview(locationTextField)
        addSubview(notesField)
        addSubview(datePicker)
        addSubview(addEventButton)
        addSubview(toggles)
        
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        notesField.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        addEventButton.translatesAutoresizingMaskIntoConstraints = false
        toggles.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 18),locationTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), locationTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), notesField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 18),notesField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), notesField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), datePicker.topAnchor.constraint(equalTo: notesField.bottomAnchor, constant: 18), datePicker.trailingAnchor.constraint(equalTo: trailingAnchor), datePicker.leadingAnchor.constraint(equalTo: leadingAnchor), addEventButton.bottomAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 25), addEventButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -170), toggles.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor), toggles.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
    }
}
