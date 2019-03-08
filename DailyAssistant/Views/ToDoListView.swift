//
//  ToDoListView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/8/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import EventKit

class ToDoListView: UIView {
    
    let placeholderText = "Enter reminder(s)"
    public lazy var toDoLabel: UILabel = {
      let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "thonburi", size: 20)
        label.text = "Add Reminder"
        return label
    }()
    
    public lazy var newItemTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.09883943945, green: 0.0765587464, blue: 0.4475694299, alpha: 0.7132384418)
        textView.textColor = .white
        textView.text = "Enter To-Do"
        return textView
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
    
    public lazy var addNoteButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add Note", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.titleLabel?.font = UIFont.init(name: "thonburi", size: 18)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        addButton.addTarget(self, action: #selector(addNewNote), for: .touchUpInside)
        return addButton
    }()
    
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
                    event.title = self.newItemTextView.text
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
        addSubview(toDoLabel)
        addSubview(newItemTextView)
        addSubview(addNoteButton)
        addSubview(toggles)
        
       
       toDoLabel.translatesAutoresizingMaskIntoConstraints = false
        newItemTextView.translatesAutoresizingMaskIntoConstraints = false
        addNoteButton.translatesAutoresizingMaskIntoConstraints = false
        toggles.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toDoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50), toDoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), toDoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), newItemTextView.topAnchor.constraint(equalTo: toDoLabel.bottomAnchor, constant: 22), newItemTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), newItemTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), newItemTextView.heightAnchor.constraint(equalToConstant: 200), addNoteButton.topAnchor.constraint(equalTo: newItemTextView.bottomAnchor), addNoteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -170),toggles.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor), toggles.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
    }
    
}
