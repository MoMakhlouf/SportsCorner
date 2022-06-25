//
//  EventsViewModel.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import Foundation

class EventsViewModel{
    
    var eventArray : [Event]?{
        didSet{
            bindingData(eventArray , nil)
        }
    }
    
    var error  : Error?{
        didSet{
            bindingData (nil , error)
        }
    }
    
    let apiService : ApiServices
    var bindingData : (([Event]? , Error?) -> Void) = {_,_ in}
    init(apiService : ApiServices = NetworkManager()){
        self.apiService = apiService
    }
    
    func fetchEvent(endPoint : String){
        apiService.fetchEvents(endPoint: endPoint) { events, error in
            
            if let events = events {
                self.eventArray = events
               
            }
            if let error = error {
                self.error = error
            }
            
          //  print(self.eventArray)
        }
     }
}
