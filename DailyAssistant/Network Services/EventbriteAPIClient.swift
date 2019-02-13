//
//  EventbriteAPIClient.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

final class EventbriteAPIClient {
    static func getEvent(completionHandler: @escaping(AppError?, [Event]?) -> Void) {
        let URL = "https://www.eventbriteapi.com/v3/events/search?location.within=10km&expand=venue-H'Authorization:BearerPERSONAL_OAUTH_TOKEN'&location.address=vancovuer&token=HGCVIXQ3FJZNEZUHE4G2"
        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
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