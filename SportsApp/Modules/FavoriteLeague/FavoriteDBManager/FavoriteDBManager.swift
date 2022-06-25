//
//  FavoriteDBManager.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 22/06/2022.
//

import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteFavLeague(indexPath: IndexPath)
}

class FavoriteDBManager{
    static let sharedInstance = FavoriteDBManager()
    private init(){}
}

extension FavoriteDBManager {
    
    func addLeague(appDelegate : AppDelegate , leagueName : String , leagueImage : String , leagueID : String){
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: managedContext){
            
        let league = NSManagedObject(entity: entity, insertInto: managedContext)
            league.setValue(leagueName, forKey: "leagueName")
            league.setValue(leagueImage, forKey: "leagueImage")
            league.setValue(leagueID, forKey: "leagueID")
            
            do{
                try managedContext.save()
            }catch{
            Alert.displayAlert(title: "try again later", message: "Connection Error")
            }
        }
    }
    
    func fetchLeague(appDelegate : AppDelegate) -> [FavLeague]{

        var fetchedList : [FavLeague] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [FavLeague]
        }catch{
            Alert.displayAlert(title: "try again later", message: "Connection Error")
        }
        return fetchedList
    }
    
    
    func delete(league:FavLeague, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){

        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(league)
        do{
            try managedContext.save()
            delegate.deleteFavLeague(indexPath: indexPath)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    
}


