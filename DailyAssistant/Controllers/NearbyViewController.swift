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
    private let locationManager = CLLocationManager()
    private var coordinatesToSearch = CLLocationCoordinate2D(latitude: 40.626994, longitude: -74.009727)
    private var events = [Event]()
    private var annotations = [MKAnnotation]()
    private var myCurrentRegion = MKCoordinateRegion() {
        didSet {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nearby Events"
        view.addSubview(nearbyView)
        self.view.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Current Location", style: .plain, target: self, action: #selector(CurrentLocate))
        nearbyView.mapView.delegate = self
        nearbyView.tableView.dataSource = self
        locationManager.delegate = self
        nearbyView.searchBar.delegate = self
    }
    
    private func searchEvents(keyword: String){
        EventbriteAPIClient.getEvent(keyword: "yoga") { (error, events) in
            if let error = error {
                print("searching events error")
            } else if let events = events {
                self.events = events
            }
        }
    }
    @objc private func CurrentLocate() {
        nearbyView.mapView.setCenter(myCurrentRegion.center, animated: true)
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
extension NearbyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyTableViewCell", for: indexPath)
        let eventInfo = events[indexPath.row]
        cell.textLabel?.text = eventInfo.name.text
        cell.detailTextLabel?.text = eventInfo.name.html
        return cell
    }
}
extension NearbyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
        !text.isEmpty,
            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("not valid")
                return
        }
    searchEvents(keyword: searchText)
    }
}
