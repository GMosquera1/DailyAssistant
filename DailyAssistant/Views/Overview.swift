//
//  ToDoView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class Overview: UIView {
    
    public lazy var weatherCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 150, height: 150)
        layout.scrollDirection = .horizontal
    
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.isPagingEnabled = true
        cv.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCollectionViewCell")
        return cv
    }()
    
//    public lazy var calendar: NSCalendar = {
//       var cal = NSCalendar(
//        
//        return cal
//    }()
//    
    
    public lazy var toDoTableView: UITableView = {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.frame.width
        let displayHeight: CGFloat = self.frame.height
        var tv = UITableView()
        tv.sectionIndexBackgroundColor = .clear
        tv.backgroundColor = UIColor.clear
        tv = UITableView(frame: .init(x: 25, y: 25, width: 25, height: 25) , style: .grouped)
        //        tv.delegate = self
        //        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.layer.cornerRadius = 10.0
        //    toDoTableView.reloadData()
        return tv
    }()
    
    public lazy var eventsTableView: UITableView = {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.frame.width
        let displayHeight: CGFloat = self.frame.height
        var tv = UITableView()
        tv.sectionIndexBackgroundColor = .clear
        tv.backgroundColor = UIColor.clear
        tv = UITableView(frame: .init(x: 25, y: 25, width: 25, height: 25) , style: .grouped)
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.layer.cornerRadius = 10.0
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
        
        addSubview(weatherCV)
        addSubview(toDoTableView)
        addSubview(eventsTableView)
        
        weatherCV.translatesAutoresizingMaskIntoConstraints = false
        toDoTableView.translatesAutoresizingMaskIntoConstraints = false
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([weatherCV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),weatherCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), weatherCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),weatherCV.heightAnchor.constraint(equalToConstant: 150)])
        
        NSLayoutConstraint.activate([toDoTableView.topAnchor.constraint(equalTo: weatherCV.bottomAnchor), toDoTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), toDoTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), toDoTableView.bottomAnchor.constraint(equalTo: eventsTableView.topAnchor),eventsTableView.topAnchor.constraint(equalTo: toDoTableView.bottomAnchor), eventsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), eventsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11), eventsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
}



