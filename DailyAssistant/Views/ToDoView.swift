//
//  EventView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class ToDoView: UIView {

    public lazy var eventInfoView: UITextView = {
        let infoView = UITextView()
        infoView.text = "hello"
        return infoView
    }()
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

    override init(frame: CGRect){ super.init(frame: UIScreen.main.bounds)
        commonInit()
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
    titleTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22), titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22), locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 11),locationTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22), locationTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22), locationTextField.bottomAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.bottomAnchor, multiplier: 0)])
    }
}
