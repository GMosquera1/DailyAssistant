//
//  NearbyViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearbyViewController: UIViewController {
    
    let nearbyView = NearbyView()
    var alert: UIAlertController!
    private let locationManager = CLLocationManager()
    private var coordinatesToSearch = CLLocationCoordinate2D(latitude: 40.626994, longitude: -74.009727)
    private var events = [Event]() {
        didSet{
            DispatchQueue.main.async {
                self.nearbyView.tableView.reloadData()
            }
        }
    }
    private var annotations = [MKAnnotation]()
    private var myCurrentRegion = MKCoordinateRegion() {
        didSet {
            searchEvents(keyword: String())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print(DataPersistenceManager.documentsDirectory())
        title = "Nearby Events"
        view.addSubview(nearbyView)
        self.view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Locate Me", style: .plain, target: self, action: #selector(CurrentLocate))
        nearbyView.mapView.delegate = self
        nearbyView.tableView.dataSource = self
        nearbyView.tableView.delegate = self
        locationManager.delegate = self
        nearbyView.searchBar.delegate = self
        searchEvents(keyword: "yoga")
        checkLocationServices()
        setupKeyboardToolbar()
        alert = UIAlertController(title: "Enter", message: "Name of Current City", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Zip Code"
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            self.alert.addAction(ok)
        }
        present(alert, animated: true, completion: nil)
    }
    
    private func searchEvents(keyword: String){
        EventbriteAPIClient.getEvent(city: keyword, isZipcode: true) { (error, events) in
            if let error = error {
                print("searching events error:\(error)")
            } else if let events = events {
                self.events = events
            }
        }
    }
    
        fileprivate func addAnnotations() {
//            nearbyView.mapView.removeAnnotation(annotations)
//            annotations.removeAll()
            
//            for event in events {
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = CLLocationCoordinate2D(latitude: venue, longitude: <#T##CLLocationDegrees#>)
//            }
        }
    
    private func userDefaultSearchTerm() -> String {
        if let searchTermFromUserDefaults =
            UserDefaults.standard.object(forKey: UserDefaultsKey.searchTerm) as? String {
            return searchTermFromUserDefaults
        } else {
            return "yoga"
        }
    }
    
    
    @objc private func CurrentLocate() {
        nearbyView.mapView.setCenter(myCurrentRegion.center, animated: true)
    }
    
    func checkLocationServices() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse { locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            nearbyView.mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            nearbyView.mapView.showsUserLocation = true
    }
    
}


private func setupKeyboardToolbar() {
    let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width:self.view.frame.size.width , height: 30))
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    nearbyView.searchBar.inputAccessoryView = toolbar
}
    @objc private func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    
}
extension NearbyViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            coordinatesToSearch = myCurrentRegion.center
        }
        let currentRegion = MKCoordinateRegion(center: coordinatesToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
        nearbyView.mapView.setRegion(currentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myCurrentRegion = MKCoordinateRegion()
        if let currentLocation = locations.last {
            myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            
        } else {
            myCurrentRegion = MKCoordinateRegion(center: coordinatesToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
}

extension NearbyViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Callouts") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Callouts")
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let calloutClicked = view.annotation else {
            fatalError("callout is nil")
        }
        if let eventName = calloutClicked.title, let eventDetails = (events.filter {$0.name.text == eventName}).first {
            let destination = NearbyEventsViewController(eventsFull: eventDetails)
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
}
extension NearbyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = nearbyView.tableView.dequeueReusableCell(withIdentifier: "NearbyTableViewCell", for: indexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "NearbyTableViewCell")
        let eventInfo = events[indexPath.row]
        cell.textLabel?.text = eventInfo.name.text
        cell.detailTextLabel?.text = eventInfo.name.html
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Nearby Events"
    }
    
}
extension NearbyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text,
            !text.isEmpty,
            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("not valid")
                return
        }
        searchEvents(keyword: searchText)
    }
}
