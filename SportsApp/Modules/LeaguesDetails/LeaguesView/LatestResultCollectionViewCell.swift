//
//  LatestResultCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 23/06/2022.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeTeamResult: UILabel!
    @IBOutlet weak var awayTeamResult: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.makeCorner()
     
    }

    func getResults(_ event : Event) {
        homeTeam.text = event.strHomeTeam
        homeTeamResult.text = event.intHomeScore
        awayTeam.text = event.strAwayTeam
        awayTeamResult.text = event.intAwayScore
        time.text = event.strTime
        data.text = event.dateEvent
        
    }
}
