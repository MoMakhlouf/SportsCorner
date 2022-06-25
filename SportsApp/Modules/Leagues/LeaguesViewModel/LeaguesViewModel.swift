//
//  LeaguesViewModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 19/06/2022.
//

import Foundation

class LeaguesViewModel {
    
    var leaguesArray : [League]?{
        didSet{
            bindingData(leaguesArray , nil)
        }
    }
    var error : Error?{
        didSet{
            bindingData(nil , error)
        }
    }
    
    var bindingData : (([League]? , Error?) -> Void) = {_ , _ in}
    let leaguesApiService : ApiServices
    init(leagueApi: ApiServices = NetworkManager()){
        self.leaguesApiService = leagueApi
    }
    
    func fetchData(endPoint : String){
        leaguesApiService.fetchLeagues(endPoint: endPoint) { leagues, error in
            if let leagues = leagues{
                self.leaguesArray = leagues
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
    
    

