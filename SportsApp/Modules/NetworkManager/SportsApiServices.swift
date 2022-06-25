//
//  ApiServices.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import Foundation
import UIKit

protocol ApiServices {
    //Sport Api
    func fetchSports(endPoint : String , completion : @escaping (([Sport]? , Error?) -> Void))
    //League Api
    func fetchLeagues(endPoint : String , completion : @escaping (([League]? , Error?) -> Void))
    //LeaguesDetails team
    func fetchLeaguesDetails(endPoint : String , afterEndPoint: String , completion : @escaping (([Team]? , Error?) -> Void))
    //Event and results details
    func fetchEvents(endPoint : String , completion : @escaping (([Event]? , Error?) -> Void))

}
