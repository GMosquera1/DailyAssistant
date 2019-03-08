//
//  EventbriteAPIClient.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

final class EventbriteAPIClient {
    static func getEvent(city: String, isZipcode: Bool, completionHandler: @escaping(AppError?, [Event]?) -> Void) {
        // TO-DO = Check URL for search functionality
        // interpolate for location 
       var endPointURL = ""
        if isZipcode {
            endPointURL = "https://www.eventbriteapi.com/v3/events/search?location.within=10km&expand=venue-H'Authorization:BearerPERSONAL_OAUTH_TOKEN'&location.address=\(city)&token=HGCVIXQ3FJZNEZUHE4G2"
        } else {
            guard let zipCode =
            city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("encoding city error: \(city)")
                return
            }
            endPointURL = "https://www.eventbriteapi.com/v3/events/search?location.within=10km&expand=venue-H'Authorization:BearerPERSONAL_OAUTH_TOKEN'&location.address=\(zipCode)&token=HGCVIXQ3FJZNEZUHE4G2"
        }
        let URL =
        NetworkHelper.shared.performDataTask(endpointURLString: endPointURL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let eventInfo = try JSONDecoder().decode(Eventbrite.self, from: data)
                    completionHandler(nil, eventInfo.events)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
