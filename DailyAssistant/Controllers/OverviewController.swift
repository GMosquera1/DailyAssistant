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
                
                self.overView.weatherCV.reloadData()
            }
        }
    }
    
    let overView = Overview()
    let todoView = ToDoView()
    var events = EventsDataModel.getEventData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(overView)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "stars")!)
        //        overView.eventsTableView.dataSource = self
        //        overView.eventsTableView.delegate = self
        //        overView.eventsTableView.backgroundColor = UIColor.red
        overView.toDoTableView.dataSource = self
        overView.toDoTableView.delegate = self
         print(DataPersistenceManager.documentsDirectory())
        overView.toDoTableView.backgroundColor = UIColor.clear
//        overView.toDoTableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(newVC))
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
        let eventStore = EKEventStore()
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore)
        case .denied:
            print("access denied")
        case .notDetermined:
            eventStore.requestAccess(to: .event, completion: {[weak self] (granted: Bool, error: Error?) -> Void in
                if granted {
                    self!.insertEvent(store: eventStore)
                } else {
                    print("Access Denied")
                }
            })
        default:
            print("Access denied")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        overView.toDoTableView.reloadData()
//        overView.eventsTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showToDoDetail" {
            guard let indexPath = overView.toDoTableView.indexPathForSelectedRow,
                let toDoViewController = segue.destination as?
                ItemDetailViewController else {
                    fatalError("indexPath, toDoViewController nil")
            }
            let toDo = ToDosModel.getItems()[indexPath.row]
            toDoViewController.toDo = toDo
         
    }
}

func insertEvent(store: EKEventStore) {
    let calendars = store.calendars(for: .event)
    
    for calendar in calendars {
        if calendar.title == "Calendar" {
            let startDate = Date()
            let endDate = startDate.addingTimeInterval(2 * 60 * 60)
            let event = EKEvent(eventStore: store)
            event.calendar = calendar
            event.title = "New Event"
            event.startDate = startDate
            event.endDate = endDate
            
            do {
                try store.save(event, span: .thisEvent)
            }
            catch {
                print("Error saving event in calendar")
            }
        }
    }
}

func setUp() {
    navigationItem.title = "Today's Events"
    navigationController?.navigationBar.barTintColor = UIColor.clear
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    
}

@objc private func newVC(button: UIBarButtonItem) -> Void {
    button.isEnabled = true
    let test = EventPagesViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    navigationController?.pushViewController(test, animated: true)
}
}
extension OverviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            let toDo = ToDosModel.getItems()[indexPath.row]
            cell.textLabel?.text = toDo.title
            cell.detailTextLabel?.text = toDo.dateFormattedString
//            guard let cell =
//                tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
//
//
//            cell.backgroundColor = UIColor.clear
//            cell.layer.cornerRadius = 10.0
//            if cell.isSelected == true {
//                cell.backgroundColor = .white
//            } else {
//                cell.backgroundColor = UIColor.clear
//            }
            
            return cell
        default:
            guard let cell =
                tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
            cell.textLabel?.text = events[indexPath.row].description
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
            return ToDosModel.getItems().count
        case 1:
            return events.count
        default:
            return 0
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
        let arrTitles = ["Reminders", "Events","To-Dos"]
        return arrTitles[section]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let toDo = ToDosModel.getItems()[indexPath.row]
        ToDosModel.delete(item: toDo, atIndex: indexPath.row) 
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        switch indexPath.section {
//        case 0:
//            return 35
//        case 1:
//            return 35
//        case 2:
//            return 35
//        default:
//            return 100
//        }
//    }
}

extension OverviewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell else { return UICollectionViewCell() }
        let day = forecast[indexPath.row]
        // cell.weatherCity.text = "Welcome to \(cit"
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
