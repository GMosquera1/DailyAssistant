//
//  ItemDetailViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import UserNotifications

private enum EditMode: String {
    case edit = "Edit"
    case done = "Done"
    public func updateBarButtonTile() -> String {
        switch self {
        case .done:
            return "Edit"
        case .edit:
            return "Done"
        }
    }
}

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemTitleTextView: UITextView!
    @IBOutlet weak var itemDescriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    public var toDo: ToDo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateTextViewEditingState(isEditingItem: false)

        UNUserNotificationCenter.current().delegate = self
    }
    
    private func configureInputAccesoryView() {
        let dismissBarItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissKeyboard))
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        toolbar.items = [dismissBarItem]
        itemTitleTextView.inputAccessoryView = toolbar
        itemDescriptionTextView.inputAccessoryView = toolbar
    }

    @objc private func dismissKeyboard() {
        itemTitleTextView.resignFirstResponder()
        itemDescriptionTextView.resignFirstResponder()
    }
    
    private func updateUI() {
        itemTitleTextView.text = toDo.title
        
    }
    
    @IBAction func editItem(_ sender: UIBarButtonItem) {
        updateRightBarItem(editMode: EditMode.edit)
        updateTextViewEditingState(isEditingItem: true)
    }
    
    private func updateRightBarItem(editMode: EditMode) {
        switch editMode {
        case .edit:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneEditing))
        case .done:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editItem(_:)))
        }
    }
    @objc private func doneEditing() {
        updateRightBarItem(editMode: EditMode.done)
        updateTextViewEditingState(isEditingItem: false)
        guard let itemTitle = itemTitleTextView.text,
            let itemDescription = itemDescriptionTextView.text else {
                print("ItemTitle, item description is nil")
                return
        }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate, .withInternetDateTime, .withTimeZone, .withDashSeparatorInDate]
        let modifiedTimestamp = isoDateFormatter.string(from: date)
      let updatedItem = ToDo.init(title: itemTitle,createdAt: modifiedTimestamp)
        
        let index = ToDosModel.getItems().firstIndex { $0 == toDo }
        if let itemIndex = index {
            ToDosModel.updateItem(updatedItem: updatedItem, atIndex: itemIndex)
        }
    }
    private func updateTextViewEditingState(isEditingItem: Bool) {
        if isEditingItem {
            itemTitleTextView.isEditable = true
            itemDescriptionTextView.isEditable = true
            itemTitleTextView.becomeFirstResponder()
            configureInputAccesoryView()
        } else {
            itemTitleTextView.isEditable = false
            itemDescriptionTextView.isEditable = false
        }
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: toDo.title, arguments: nil)
//        content.body = NSString.localizedUserNotificationString(forKey: toDo.description, arguments: nil)
        content.sound = UNNotificationSound.default
        
        let date = datePicker.date
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
   
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minutes
        dateComponents.timeZone = TimeZone.current
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "To Do List Alert", content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("adding notification delivery error: \(error)")
            } else {
                print("succesfully added notification")
            }
        }
    }
    
}

extension ItemDetailViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
