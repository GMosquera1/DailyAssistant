//
//  Events.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/11/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct EventsData: Codable, Equatable {
    let description: String
    let createdAt: String
    
    init(description: String, createdAt: String) {
        self.description = description
        self.createdAt = createdAt
    }
    public var dateFormattedString: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = createdAt
        if let date = isoDateFormatter.date(from: createdAt) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: createdAt) {
            formattedDate = date
        }
        return formattedDate
    }
}
