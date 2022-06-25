//
//  ViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sportsCollectionView: UICollectionView!{
        didSet{
            sportsCollectionView.dataSource = self
            sportsCollectionView.delegate = self
        }
    }
    
    var sportsArray = [Sport]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let sportViewModel = SportsViewModel()
        sportViewModel.fetchData(endPoint: "all_sports.php")
        
        sportViewModel.bindingData = { sports,error in
            if let sports = sports {
                self.sportsArray = sports
                
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            }
            if let error = error{
                print(error)
                Alert.displayAlert(title: "Try Again", message: "NO Internet Available")
            }
        }
    }
    
}

//MARK: - CollectionView dataSource and Delegate
extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return sportsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCell", for: indexPath) as! SportsCollectionViewCell

        cell.showSports(show: sportsArray[indexPath.row])
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let leaguesVc = storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
        self.navigationController?.pushViewController(leaguesVc, animated: true)

        leaguesVc.getSportName = sportsArray[indexPath.row].strSport!
    }
}




//MARK: - Collection View Size

extension ViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.size.width*0.45 , height: view.frame.size.width*0.35)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.6
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 1, left: 15 , bottom: 1, right: 15)
    }

    

}

//
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    return CGSize(width: view.frame.size.width*0.482 , height: view.frame.size.width*0.49)
//
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return 8
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    return 0.2
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//    return UIEdgeInsets(top: 1, left: 4 , bottom: 1, right: 4)
//}



