//
//  Urls.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import Foundation

struct Urls {
    var endPoint: String = ""
    var afterEndPoint : String = ""
    
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
     var leagueUrl : String {
         return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(endPoint)"
     }
     
    // TeamURL
    var byUrl: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)?l=\(afterEndPoint)"
    }
    // EventUrl
    var eventUrl : String {
        return "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(endPoint)"
    }
}


