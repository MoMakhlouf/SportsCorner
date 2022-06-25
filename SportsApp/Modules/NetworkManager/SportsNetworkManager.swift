//
//  SportsNetworkManager.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import Foundation

class NetworkManager : ApiServices{
   
   // static let shared = NetworkManager()
    
  //MARK: - SPORTS NETWORKING
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        if let url = URL(string: Urls(endPoint: endPoint).url){
       let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
           guard let data = data else { return }
                    
           guard let decodedData = try? JSONDecoder().decode(SportsModel.self, from: data) else{ return}
           
           completion(decodedData.sports , nil)
         }
            task.resume()
        }
    }
    
    
    //MARK: - lEAGUES NETWORKING

    func fetchLeagues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void)) {
        
        if let url = URL(string: Urls(endPoint: endPoint).leagueUrl){
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data {
                    if let decodedData = try? JSONDecoder().decode(LeaguesModel.self, from: data){
                        completion(decodedData.countries , nil)
                       // print(decodedData.countries)
                    }
                }
            }
            task.resume()
        }
    }
        
    
    //MARK: - TEAMS LEAGUES DETAILS NETWORKING

    func fetchLeaguesDetails(endPoint: String,afterEndPoint: String , completion: @escaping (([Team]?, Error?) -> Void)) {
        
        if let url = URL(string: Urls(endPoint: endPoint , afterEndPoint: afterEndPoint).byUrl){
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data {
                
                    if let decodedData = try? JSONDecoder().decode(TeamDetails.self, from: data){
                        completion(decodedData.teams , nil)
                    }
                }
            }
            task.resume()
        }
    }
    
    //MARK: - Events Networking
    
    func fetchEvents(endPoint: String, completion: @escaping (([Event]?, Error?) -> Void)) {
        
        if let url = URL(string: Urls(endPoint: endPoint).eventUrl){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedData = try? JSONDecoder().decode(EventsDetails.self, from: data){
                        completion(decodedData.events , nil)
                    }
                }
            }
             task.resume()
        }
    }
    
}
