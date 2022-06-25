//
//  SportsCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 18/06/2022.
//

import UIKit
import SDWebImage
class SportsCollectionViewCell: UICollectionViewCell {

 
    @IBOutlet weak var sportsImage: UIImageView!
    @IBOutlet weak var sportsName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCorner()
       // sportsImage.makeImageCorner()
        sportsImage.makeImageCorner()
    }
    
    func showSports(show sports : Sport) {
        sportsName.text = sports.strSport
        
        sportsImage.sd_setImage(with: URL(string: sports.strSportThumb!), placeholderImage: UIImage(named: "sportsCorener"))
        
        
    }

}


