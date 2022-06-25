//
//  EventsModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import Foundation

struct EventsDetails: Codable {
    let events: [Event]
}
// MARK: - Event
struct Event: Codable {
    let idEvent: String?
    let strEvent,strFilename: String?
    let idLeague: String?
    let strTimestamp, dateEvent: String?
    let strTime: String?
    let strVenue , intHomeScore , strHomeTeam , intAwayScore , strAwayTeam: String?
}
