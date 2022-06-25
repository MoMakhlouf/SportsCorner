//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 19/06/2022.
//

import UIKit

class LeaguesTableViewController: UITableViewController {
   
    var leaguesArray = [League]()
    var getSportName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        
        
        let leaguesViewModel = LeaguesViewModel()
        leaguesViewModel.fetchData(endPoint: getSportName)
        leaguesViewModel.bindingData = { leagues , error in
            
            if let leagues = leagues{
              for l in leagues{
                  if l.strSport == self.getSportName {
                      self.leaguesArray.append(l)
                  }
              }
              DispatchQueue.main.async {
                self.tableView.reloadData()
              }
           }
             if let error = error{
                print(error)
                 Alert.displayAlert(title: "try again", message: "No Internet Connection")
            }
        }
    }
}
    // MARK: - Table view data source
    extension LeaguesTableViewController{
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  leaguesArray.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesTableViewCell
    
        cell.getLeagues(leaguesArray[indexPath.row])
        // sending data into videoVC by a closure
        cell.videoAction = {
            let videoView = self.storyboard?.instantiateViewController(withIdentifier: "video") as! YoutubeViewController
            videoView.link = self.leaguesArray[indexPath.row].strYoutube ?? "www.youtube.com"
            self.present(videoView, animated: true)
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "detailsSegue"{
            let detailsVc = segue.destination as? LeaguesViewController
            detailsVc?.leagueImage = leaguesArray[tableView.indexPathForSelectedRow!.row].strBadge ?? ""
            detailsVc?.leagueName = leaguesArray[tableView.indexPathForSelectedRow!.row].strLeague
            detailsVc?.leagueID = leaguesArray[tableView.indexPathForSelectedRow!.row].idLeague
        }
    }
}
