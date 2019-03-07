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
    
    public var cityName = ""
    var alert: UIAlertController!
    public var forecast = [Periods](){
        didSet {
            DispatchQueue.main.async {
              self.overView.toDoTableView.reloadData()
                self.overView.weatherCV.reloadData()
            }
        }
    }
    
    let overView = Overview()
    let todoView = ToDoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(overView)

        view.backgroundColor = UIColor(patternImage: UIImage(named: "stars")!)
        overView.toDoTableView.dataSource = self
        overView.toDoTableView.delegate = self
        overView.toDoTableView.backgroundColor = UIColor.clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Event", style: .done, target: self, action: #selector(newVC))
        setUp()
        WeatherAPIClient.searchWeather(zipcode: "10014", isZipcode: true) { (appError, periods) in
            if let error = appError {
                print(error.errorMessage())
            }
            if let periods = periods {
                self.forecast = periods
                dump(self.forecast)
            }
        }
        overView.weatherCV.dataSource = self
        overView.weatherCV.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCollectionViewCell")
        alert = UIAlertController(title: "Enter", message: "Name of Current City", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Zip Code"
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            self.alert.addAction(ok)
        }
        present(alert, animated: true, completion: nil)
//        showAlert(title:  "Enter Zipcode" , message: "Please enter zipcode", style: .alert) { (alert) in
//            
//      
//        }
        // create UI Alert with an action called showalert or
    }
    
    func setUp() {
        navigationItem.title = "Today's Events"
        navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    @objc private func newVC(button: UIBarButtonItem) -> Void {
        button.isEnabled = true
        var toDoViewController = ToDoViewController()
        //present(toDoViewController, animated: true, completion: nil)
        navigationController?.pushViewController(toDoViewController, animated: true)
    }
}
extension OverviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell =
                tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
         //    let day = forecast.first

            cell.backgroundColor = UIColor.clear
            cell.layer.cornerRadius = 10.0
            if cell.isSelected == true {
                cell.backgroundColor = .white
            } else {
                cell.backgroundColor = UIColor.clear 
            }

            return cell
        default:
            guard let cell =
                tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
            cell.textLabel?.text = "hola hola hola"
            cell.textLabel?.textColor = .white
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.backgroundColor = UIColor.clear
            cell.layer.cornerRadius = 10.0
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 2
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension OverviewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let arrTitles = ["Birthdays", "Events","To-Do"]
        return arrTitles[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 35
        case 1:
            return 35
        case 2:
            return 35
        default:
            return 100
        }
    }
}

extension OverviewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else { return UICollectionViewCell() }
        let day = forecast[indexPath.row]
        cell.weatherCity.text = "Welcome to "
        cell.weatherImage.image = UIImage(named: day.icon)
        cell.weatherDay.text = "\(day.dateFormattedTime)"
        cell.weatherHigh.text = "H: \(day.maxTempF)°F/ \(day.maxTempC)°C"
        cell.weatherLow.text = "L: \(day.minTempF)°F/ \(day.minTempC)°C"
        return cell
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
