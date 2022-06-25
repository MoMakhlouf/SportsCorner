//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {
   
    
    var team = Team(idTeam: "", strTeam: "", strSport: "", strLeague: "", strTeamBadge: "" , strStadium: "" , strStadiumThumb: "" , strTeamShort: "" , intFormedYear: "" , strDescriptionEN: "")
   
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamShortName: UILabel!
    @IBOutlet weak var teamSinceYear: UILabel!
    @IBOutlet weak var teamStadiumImage: UIImageView!
    @IBOutlet weak var teamStasdiumName: UILabel!
    @IBOutlet weak var teamDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        teamName.text = team.strTeam
        teamSinceYear.text = team.intFormedYear ?? ""
        teamImage.sd_setImage(with: URL(string: team.strTeamBadge ?? " "), placeholderImage: UIImage(named: "sportsCorener"))
        teamStadiumImage.makeImageCorner()
        teamStadiumImage.sd_setImage(with: URL(string: team.strStadiumThumb ?? " "), placeholderImage: UIImage(named: "unAvailable"))
        teamStasdiumName.text = team.strStadium
        teamDesc.text = team.strDescriptionEN
    }

}
