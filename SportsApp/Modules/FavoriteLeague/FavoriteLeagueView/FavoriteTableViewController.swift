//
//  FavoriteTableViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import UIKit
import SDWebImage

class FavoriteTableViewController: UITableViewController {
   
    var leagues = [FavLeague]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let leagueDB = FavoriteDBManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
   
        self.refreshControl = UIRefreshControl()
        guard let refreshControl = refreshControl else {return}
         refreshControl.attributedTitle = NSAttributedString(string: "Refreshing..")
         refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
         tableView.addSubview(refreshControl)
        
           fetchLeague()
   }
}
 
//MARK: - Fetching data to favorite tableView
extension FavoriteTableViewController {
    override func viewWillAppear(_ animated: Bool) {
        fetchLeague()
        tableView.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        fetchLeague()
        refreshControl?.endRefreshing()
    }
        
    func fetchLeague(){
        leagues = leagueDB.fetchLeague(appDelegate: appDelegate)
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
}

    // MARK: - Table view data source
extension FavoriteTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavoriteTableViewCell
        
        cell.addData(leagues[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork(){
           let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailVc") as! LeaguesViewController
             detailsVC.leagueName  = leagues[indexPath.row].leagueName ?? ""
             detailsVC.leagueID    = leagues[indexPath.row].leagueID ?? ""
          //   detailsVC.favoriteButton.image     = UIImage(systemName: "heart.fill")
           //  detailsVC.favoriteButton.isEnabled = false
            present(detailsVC, animated: true, completion: nil)
     //       navigationController?.pushViewController(detailsVC, animated: true)
            
        }else{
            Alert.displayAlert(title: "try again", message: "No Internet Connection")
        }
    }
}

// DELETE BY SWIPE
extension FavoriteTableViewController: DeletionDelegate{
    func deleteFavLeague(indexPath: IndexPath) {
        leagues.remove(at: indexPath.row)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
        FavoriteDBManager.sharedInstance.delete(league: leagues[indexPath.row], indexPath: indexPath, appDelegate: appDelegate, delegate: self)
           // leagues.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath] ,with: .fade)
            tableView.endUpdates()
        }
    }
}

//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        FavoriteDBManager.sharedInstance.delete(league: leagues[indexPath.row], indexPath: indexPath, appDelegate: appDelegate, delegate: self)
//
//        let delete = UIContextualAction(style: .destructive,title: "delete") {(action, view, completionHandler) in
//        completionHandler(true)
//        }
//        delete.backgroundColor = .red
//      let config = UISwipeActionsConfiguration(actions: [delete])
//      return config
//    }
