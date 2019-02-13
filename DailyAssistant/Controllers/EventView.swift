//
//  EventView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class EventView: UIView {

    public lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        return textField
    }()
    public lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Location"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        return textField
    }()

//    public lazy var datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode
//        return datePicker
//    }()
    
    public lazy var notesField: UITextInput = {
        let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        return textField
    }()

}
