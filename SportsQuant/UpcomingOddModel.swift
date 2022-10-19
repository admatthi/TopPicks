//
//  UpcomingOddModel.swift
//  SportsQuant
//
//  Created by talal ahmad on 11/10/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let upcomingOdds = try? newJSONDecoder().decode(UpcomingOdds.self, from: jsonData)

import Foundation

// MARK: - UpcomingOdd
class UpcomingOdd: Codable {
    let id, sportKey, sportTitle: String?
    let commenceTime: String?
    let homeTeam, awayTeam: String?
    let bookmakers: [Bookmaker]?

    enum CodingKeys: String, CodingKey {
        case id
        case sportKey = "sport_key"
        case sportTitle = "sport_title"
        case commenceTime = "commence_time"
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case bookmakers
    }

    init(id: String?, sportKey: String?, sportTitle: String?, commenceTime: String?, homeTeam: String?, awayTeam: String?, bookmakers: [Bookmaker]?) {
        self.id = id
        self.sportKey = sportKey
        self.sportTitle = sportTitle
        self.commenceTime = commenceTime
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.bookmakers = bookmakers
    }
}


// MARK: - Bookmaker
class Bookmaker: Codable {
    let key, title: String?
    let lastUpdate: String?
    let markets: [Market]?

    enum CodingKeys: String, CodingKey {
        case key, title
        case lastUpdate = "last_update"
        case markets
    }

    init(key: String?, title: String?, lastUpdate: String?, markets: [Market]?) {
        self.key = key
        self.title = title
        self.lastUpdate = lastUpdate
        self.markets = markets
    }
}

// MARK: - Market
class Market: Codable {
    let key: String?
    let outcomes: [Outcome]?

    init(key: String?, outcomes: [Outcome]?) {
        self.key = key
        self.outcomes = outcomes
    }
}


// MARK: - Outcome
class Outcome: Codable {
    let name: String?
    let price: Double?

    init(name: String?, price: Double?) {
        self.name = name
        self.price = price
    }
}

typealias UpcomingOdds = [UpcomingOdd]
class Category: Codable {
    let name: String
    let key: String

    init(name: String, key: String) {
        self.name = name
        self.key = key
    }
}
class WorkHistory: Codable {
    var companyName: String
    var location: String
    var postion:String
    var fromMonth:String
    var toMonth:String
    var toYear:String
    var fromYear:String
    var isPresentWorking:Bool
    init(companyName: String, location: String,postion:String,fromMonth:String,toMonth:String,toYear:String,fromYear:String,isPresentWorking:Bool) {
        self.companyName = companyName
        self.location = location
        self.postion = postion
        self.fromMonth = fromMonth
        self.toMonth = toMonth
        self.toYear = toYear
        self.fromYear = fromYear
        self.isPresentWorking = isPresentWorking
    }
}
class IconModel: Codable {
    let title: String
    let icon: String

    init(title: String, icon: String) {
        self.title = title
        self.icon = icon
    }
}
class Section: Codable {
    let title: String
    var items: [SectionDetail]

    init(title: String, items: [SectionDetail]) {
        self.title = title
        self.items = items
    }
}
class SectionDetail: Codable {
    var title: String
    var subtitle: String

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}
