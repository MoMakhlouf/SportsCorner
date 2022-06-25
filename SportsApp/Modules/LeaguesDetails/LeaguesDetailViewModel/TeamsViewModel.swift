//
//  LeaguesDetailsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import Foundation

class DetailsViewModel {
    
    var teamsArray : [Team]?{
        didSet{
            bindingData(teamsArray , nil)
        }
    }
    var error  : Error?{
        didSet{
            bindingData (nil , error)
        }
    }
    
    let apiService : ApiServices
    var bindingData : (([Team]? , Error?) -> Void) = {_,_ in}
    init(apiService : ApiServices = NetworkManager()){
        self.apiService = apiService
    }
    
    func fetchData(endPoint : String , afterEndPoint : String){
        apiService.fetchLeaguesDetails(endPoint: endPoint , afterEndPoint: afterEndPoint) { teams, error in
            
            if let teams = teams {
                self.teamsArray = teams
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
