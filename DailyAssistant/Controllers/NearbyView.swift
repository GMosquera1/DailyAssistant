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

    public lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 5.0
        return map
    }()

    
    
    
    
}
