//
//  SportsModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import Foundation

struct SportsModel: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String?
    let strSportThumb: String?
    let strSportIconGreen: String

}


