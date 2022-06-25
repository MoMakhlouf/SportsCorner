//
//  Views.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 23/06/2022.
//

import Foundation
import UIKit

extension UIImageView{
    
    func makeRound(){
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius  = self.frame.height / 2
        clipsToBounds = true
    }
}
extension UIView{
  
    
    func makeCircular(){
        
        let cornerRadius: CGFloat = 15.0

        layer.cornerRadius = cornerRadius
                layer.masksToBounds = false
                
                // Apply a shadow
                layer.shadowRadius = 8.0
                layer.shadowOpacity = 0.10
          layer.shadowColor = UIColor.black.cgColor
                layer.shadowOffset = CGSize(width: 0, height: 5)
     layer.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}


extension UIView{
    func makeCorner(){
        let cornerRadius: CGFloat = 7.0
        layer.cornerRadius = cornerRadius
                layer.masksToBounds = false
    }
}

extension UIImageView{
    func makeImageCorner(){
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius  = 7
        clipsToBounds = true

    }
    
  
    
    
    
}
