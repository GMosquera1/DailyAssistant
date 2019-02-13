//
//  ToDoViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    
    
    public lazy var toDoTableView: UITableView = {
        var tv = UITableView()//(frame: .zero, style: .plain)
        tv.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
          //  self.view.addSubview(toDoTableView)
            setUp()
            toDoTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            toDoTableView.reloadData()
        }

    func setUp() {
           self.view.addSubview(toDoTableView)
    toDoTableView.translatesAutoresizingMaskIntoConstraints = false
        toDoTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        toDoTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
//        toDoTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        toDoTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
        
    }
    
}
extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = toDoTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
    
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [2, 3, 2][section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
