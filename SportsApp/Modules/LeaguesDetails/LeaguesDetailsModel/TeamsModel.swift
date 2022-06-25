//
//  LeaguesDetailsModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import Foundation

struct TeamDetails : Codable{
    let teams : [Team]
}

struct Team : Codable , Equatable{
    var idTeam, strTeam , strSport, strLeague, strTeamBadge, strStadium , strStadiumThumb , strTeamShort , intFormedYear , strDescriptionEN: String?
}




