//
//  LeaguesModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 19/06/2022.
//

import Foundation

//struct LeaguesModel: Codable {
//    let leagues: [League]
//}
//
//// MARK: - League
//struct League: Codable {
//    let idLeague, strLeague, strSport: String
//    let strLeagueAlternate: String?
//}


struct LeaguesModel: Codable {
    let countries : [League]
}

 // MARK: - League
struct League: Codable {
    let idLeague, strLeague, strSport: String
    let strLeagueAlternate: String?
    let strBadge , strYoutube : String?
    
}

