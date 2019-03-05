//
//  ToDoView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class Overview: UIView {
    
    public lazy var toDoTableView: UITableView = {
             let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.frame.width
        let displayHeight: CGFloat = self.frame.height
        var tv = UITableView()
        tv.separatorColor = .yellow
        tv.sectionIndexBackgroundColor = .yellow
        tv.sectionIndexColor = .blue
        tv.backgroundColor = UIColor.clear
        tv = UITableView(frame: .init(x: 25, y: 25, width: 25, height: 25) , style: .grouped)
        //        tv.delegate = self
        //        tv.dataSource = self
           tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.layer.cornerRadius = 10.0
        //    toDoTableView.reloadData()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func commonInit() {
        setConstraints()
    }
    
    func setConstraints(){
        addSubview(toDoTableView)
        
        toDoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([toDoTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22), toDoTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), toDoTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), toDoTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 22)])
    }
    
}



