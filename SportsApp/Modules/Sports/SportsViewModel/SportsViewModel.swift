//
//  SportsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import Foundation

class SportsViewModel{
    
    var sportsArray : [Sport]?{
        didSet{
            bindingData(sportsArray , nil)
        }
    }
    
    var error  : Error?{
        didSet{
            bindingData (nil , error)
        }
    }
    
    
    let apiService : ApiServices
    var bindingData : (([Sport]? , Error?) -> Void) = {_,_ in}
    init(apiService : ApiServices = NetworkManager()){
        self.apiService = apiService
    }
    
    
    
    func fetchData(endPoint : String){
        apiService.fetchSports(endPoint: endPoint) { sports, error in
            
            if let sports = sports {
                self.sportsArray = sports
            }
            if let error = error {
                self.error = error
            }
        }
        
    }
    
    
}
