//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
 
    @IBOutlet var heartView: UIView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var EventsCollectionView: UICollectionView!
    @IBOutlet weak var ResultsCollectionView: UICollectionView!
    @IBOutlet weak var TeamsCollectionView: UICollectionView!
    
   
    var leagueName = "" ; var leagueID = "" ; var leagueImage = ""
    let leagueDB = FavoriteDBManager.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var teamsArray = [Team]()
    var eventArray = [Event]()
    var latestResult = [Event]()
    var leaguesFav = [FavLeague]() // for getting array of league id to compare for button
    var isFav = false
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = leagueName
        view.addSubview(heartView)
        heartView.center = view.center
        heartView.isHidden = true
        
        fetchLeague() // for getting array of league id to compare for button

        for league in leaguesFav {
          //  print(leaguesFav)
            if league.leagueID == leagueID{
                isFav = true
                favoriteButton.image = UIImage(systemName: "heart.fill")
                favoriteButton.tintColor = .red
                print(leagueID)
            }
        }
        
        [EventsCollectionView,ResultsCollectionView,TeamsCollectionView].forEach {
            $0?.delegate   = self
            $0?.dataSource = self
        }
        
    //MARK: - FETCH TEAMS DATA fROM VIEW MODEL
    let teamViewModel = DetailsViewModel()
     teamViewModel.fetchData(endPoint: "search_all_teams.php", afterEndPoint: leagueName.replacingOccurrences(of: " ", with: "_"))
        teamViewModel.bindingData = { teams,error in
            if let teams = teams {
                self.teamsArray = teams
                DispatchQueue.main.async {
                    self.TeamsCollectionView.reloadData()
                    print(self.eventArray)
                }
            }
            if let error = error{
                print(error)
            }
            
        }
    //MARK: - FETCH EVENTS DATA
    let eventsViewModel = EventsViewModel()
    eventsViewModel.fetchEvent(endPoint: leagueID)
    eventsViewModel.bindingData = { events , error in
        if let events = events {
             self.eventArray   = events
            DispatchQueue.main.async {
             self.EventsCollectionView.reloadData()
            }
        }
        if let error = error {
            print(error)
        }
    }
    //MARK: - FETCH result DATA
    let resultViewModel = EventsViewModel()
    resultViewModel.fetchEvent(endPoint: leagueID)
    resultViewModel.bindingData = { events , error in
        if let events = events {
            self.latestResult   = events
            DispatchQueue.main.async {
                self.ResultsCollectionView.reloadData()
            }
        }
        if let error = error {
            print(error)
        }
    }
}
    
    func fetchLeague(){
        leaguesFav = leagueDB.fetchLeague(appDelegate: appDelegate)
    }
    
    //MARK: - Saving To CoreData
    @IBAction func addLeagueToFavoriteButton(_ sender: UIBarButtonItem) {
        if !isFav {
     leagueDB.addLeague(appDelegate: appDelegate, leagueName: leagueName, leagueImage: leagueImage, leagueID: leagueID)
     favoriteButton.image = UIImage(systemName: "heart.fill")
     favoriteButton.tintColor = .red
            heartView.isHidden = false
            animate()

            Timer.scheduledTimer(withTimeInterval: 1.5 , repeats: false) { timer in
               
                self.heartView.isHidden = true
            }
            favoriteButton.isEnabled = false
            favoriteButton.tintColor = .red
          
        }
        func animate() {
            self.heartView.alpha = 0
            UIView.animate(withDuration: 0.7, animations: {
                self.heartView.alpha = 1
            })
            UIView.animate(withDuration: 1.4, animations: {
                self.heartView.alpha = 0
            })
    }
    }
}


//MARK: - CollectionsViews Delegate And DataSource
extension LeaguesViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == EventsCollectionView {
            return eventArray.count > 10 ? 10 : eventArray.count
        } else if collectionView == TeamsCollectionView {
            return teamsArray.count
        }else if collectionView == ResultsCollectionView{
            return latestResult.count > 10 ? 10 : latestResult.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == EventsCollectionView {
           let eventCell = EventsCollectionView.dequeueReusableCell(withReuseIdentifier: "event", for: indexPath) as! EventsCollectionViewCell
             eventCell.getEvents(eventArray[indexPath.row])
    
            return eventCell
        }
        
        else if collectionView == ResultsCollectionView{
            let resultCell = ResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! LatestResultCollectionViewCell
            
            resultCell.getResults(latestResult[indexPath.row])
            
            return resultCell
            
        }else{
            
            let teamCell = TeamsCollectionView.dequeueReusableCell(withReuseIdentifier: "team", for: indexPath) as! TeamsCollectionViewCell
                teamCell.getTeams(teamsArray[indexPath.row])
            
               return teamCell
        }
    }

//MARK: - PASSING DATA TO TEAM DETAILS
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == TeamsCollectionView{
            let teamDetails = storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
            
            teamDetails.team.strTeam = teamsArray[indexPath.row].strTeam
            teamDetails.team.strTeamShort = teamsArray[indexPath.row].strTeamShort
            teamDetails.team.strTeamBadge = teamsArray[indexPath.row].strTeamBadge
            teamDetails.team.strStadiumThumb = teamsArray[indexPath.row].strStadiumThumb
            teamDetails.team.intFormedYear = teamsArray[indexPath.row].intFormedYear
            teamDetails.team.strStadium = teamsArray[indexPath.row].strStadium
            teamDetails.team.strDescriptionEN = teamsArray[indexPath.row].strDescriptionEN
            //navigationController?.pushViewController(teamDetails, animated: true)
            present(teamDetails, animated: true, completion: nil)
            
        }
    }
}


//MARK: - CollectionView layout

extension LeaguesViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == TeamsCollectionView {

        return CGSize(width: view.frame.size.width*0.4 , height: view.frame.size.width*0.41)
        } else if collectionView == ResultsCollectionView {
            
            return CGSize(width: view.frame.size.width*0.9 , height: view.frame.size.width*0.4)
        } else {
            return CGSize(width: view.frame.size.width*0.48 , height: view.frame.size.width*0.54)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        

        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
}

