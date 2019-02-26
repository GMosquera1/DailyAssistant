//
//  NearbyView.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import MapKit

class NearbyView: UIView {
    
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        searchBar.layer.cornerRadius = 10.0
        searchBar.placeholder = "Search Nearby Events"
        return searchBar
    }()

    public lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 5.0
        return map
    }()

    public lazy var tableView: UITableView = {
        let cellLayout = UITableViewCell()
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.layer.cornerRadius = 10.0
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.tableView.register(NearbyTableViewCell.self, forCellReuseIdentifier: "NearbyTableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func commonInt(){
        setConstraints()
    }
    
    func setConstraints(){
        addSubview(searchBar)
        addSubview(mapView)
        addSubview(tableView)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), searchBar.leadingAnchor.constraint(equalTo: leadingAnchor), searchBar.trailingAnchor.constraint(equalTo: trailingAnchor), mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0), mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0), mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0), tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0), tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0), tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0), tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
        
    }
}
