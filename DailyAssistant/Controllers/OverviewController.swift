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
    
    public var forecast = [Periods](){
        didSet {
            DispatchQueue.main.async {
              self.overView.toDoTableView.reloadData()
                
            }
        }
    }
    
    let overView = Overview()
    let todoView = ToDoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(overView)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "stars")!)
        overView.toDoTableView.dataSource = self
        overView.toDoTableView.delegate = self
        overView.toDoTableView.backgroundColor = UIColor.clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Event", style: .done, target: self, action: #selector(createNew))
        setUp()
        WeatherAPIClient.searchWeather(zipcode: "11229", isZipcode: true) { (appError, periods) in
            if let error = appError {
                print(error.errorMessage())
            }
            if let periods = periods {
                self.forecast = periods
//                dump(self.forecast)
            }
        }
    }
    
    func setUp() {
        navigationItem.title = "Today's Events"
        navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    @objc private func createNew() {
        //        let eventStore: EKEventStore = EKEventStore()
        //
        //        eventStore.requestAccess(to: .event) {(granted, error) in
        //            if (granted) && (error == nil)
        //            {
        //                print("granted \(granted)")
        //                print("error \(error)")
        //
        //                let event:EKEvent = EKEvent(eventStore: eventStore)
        //                DispatchQueue.main.async {
        //                    event.title = self.titleTextField.text
        //                }
        //                event.startDate = Date()
        //                event.endDate = Date()
        //                event.notes = "This is a note"
        //                event.calendar = eventStore.defaultCalendarForNewEvents
        //                do {
        //                    try eventStore.save(event, span: .thisEvent)
        //                } catch let error as NSError{
        //                    print("error: \(error)")
        //                }
        //                print("Save Event")
        //
        //            } else {
        //                print("error: \(error)")
        //
        //            }
        //
        //        }
        //        print("pressed")
        //    }
        //  shouldPerformSegue(withIdentifier: "toDoVC", sender: self)
    }
}
extension OverviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell =
                tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
            let day = forecast[indexPath.row]
            cell.weatherImage.image = UIImage(named: day.icon)
            cell.weatherDay.text = "\(day.dateFormattedTime)"
            cell.weatherHigh.text = "High: \(day.maxTempF)°F"
            cell.weatherLow.text = "Low: \(day.minTempF)°F"
//            cell.imageView?.image = UIImage(named: "icons8-example-500")
//            cell.textLabel?.text = "Today's Weather"
//            cell.detailTextLabel?.text = "Number"
//            cell.textLabel?.textColor = .white
            cell.backgroundColor = UIColor.clear
            cell.layer.cornerRadius = 10.0
            if cell.isSelected == true {
                cell.backgroundColor = .white
       //        cell.textLabel?.textColor = .blue
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
