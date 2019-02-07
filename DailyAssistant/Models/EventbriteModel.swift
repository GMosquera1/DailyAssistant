//
//  EventbriteModel.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

//https://www.eventbriteapi.com/v3/events/search?location.within=10km&expand=venue   -H 'Authorization: Bearer PERSONAL_OAUTH_TOKEN'&location.address=vancovuer&token=HGCVIXQ3FJZNEZUHE4G2

struct Eventbrite: Codable {
    let events: [Event]
}

struct Event: Codable {
    let name: Name
}
struct Name: Codable {
    let text: String
    let html: String
}

