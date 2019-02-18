//
//  EventsModel.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
import UIKit

struct Events: Codable {
    var eventName: String
    var eventLocation: String
    var eventDate: String
    var eventDescription: String
   // var eventImage: UIImage
}
