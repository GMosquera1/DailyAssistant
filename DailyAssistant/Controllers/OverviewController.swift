//
//  ToDoViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import CoreLocation
import EventKit
import MapKit

class OverviewController: UIViewController {
    
    let overView = Overview()

        
        override func viewDidLoad() {
            super.viewDidLoad()
           view.addSubview(overView)
            view.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
            overView.toDoTableView.dataSource = self
            overView.toDoTableView.delegate = self
            setUp()
        }

    func setUp() {
        navigationItem.title = "Today's Events"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        
    }
    
}
extension OverviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
    cell.textLabel?.text = "hola hola hola"
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [1, 3, 2][section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension OverviewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let arrTitles = ["Weather", "To-Do", "Events"]
        return arrTitles[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 35
        case 2:
            return 35
        default:
            return 100
        }
    }
}




class ListTableViewHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ListTableViewFooter: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
