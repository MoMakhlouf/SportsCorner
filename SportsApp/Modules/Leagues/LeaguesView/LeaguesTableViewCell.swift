//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 19/06/2022.
//

import UIKit
import SDWebImage

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    var videoAction: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.makeCircular()
        leagueImage.makeRound()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func getLeagues(_ league : League){
        leagueName.text = league.strLeague
        leagueImage.sd_setImage(with: URL(string: league.strBadge!), placeholderImage: UIImage(named: "sportsCorener"))

    }
    @IBAction func VideoButtonPressed(_ sender: UIButton) {
        videoAction?()
    }
}

