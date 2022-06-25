//
//  FavoriteTableViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import UIKit
import SDWebImage

class FavoriteTableViewCell: UITableViewCell {
  
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteName: UILabel!
    
    @IBOutlet weak var favCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        favCellView.makeCircular()
        favoriteImage.makeRound()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func addData(_ fav : FavLeague){
        favoriteName.text = fav.leagueName
        favoriteImage.sd_setImage(with: URL(string: fav.leagueImage!), placeholderImage: UIImage(named: "sportsCorener"))
    }
}
//extension UIColor {
//
//    convenience init(hex: Int) {
//        let components = (
//            R: CGFloat((hex >> 16) & 0xff) / 255,
//            G: CGFloat((hex >> 08) & 0xff) / 255,
//            B: CGFloat((hex >> 00) & 0xff) / 255
//        )
//        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
//    }
//
//}
//
//extension CGColor {
//
//    class func colorWithHex(hex: Int) -> CGColor {
//
//        return UIColor(hex: hex).cgColor
//
//    }
//
//}




