//
//  AnimationViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 20/06/2022.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var animateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel.text = ""
        let animate = "⚽️🏀🏓🎱🥎🏑🏈🏉⚾️🎯🏐"
        var count = 0.0
        for emo in animate{
            Timer.scheduledTimer(withTimeInterval: 0.17 * count, repeats: false) { timer in
                
                self.animateLabel.text?.append(emo)
            }
            count += 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.21 * count, repeats: false) { timer in
            
            self.push()
        }
    }
    
    func push(){
        let detailsVc = storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController

        self.navigationController?.pushViewController(detailsVc, animated: true)
    }

}
