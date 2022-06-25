//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import UIKit
import SDWebImage

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var TeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
         makeCorner()
     //   teamImage.makeRound()
    }
    
    func getTeams(_ teams : Team) {
        TeamName.text = teams.strTeam
        teamImage.sd_setImage(with: URL(string: teams.strTeamBadge ?? " "), placeholderImage: UIImage(named: "sportsCorener"))
    }
}
