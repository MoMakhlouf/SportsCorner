//
//  EventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 21/06/2022.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCorner()
    }

    func getEvents(_ event : Event) {
        eventName.text = event.strEvent?.replacingOccurrences(of: "vs", with: "\nVS\n")
       let vs = "VS"
        let range = (eventName.text! as NSString).range(of: vs)


        let attributedString = NSMutableAttributedString(string: eventName.text ?? "")
        // here you change the character to red color
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.brown, range: range)
        eventName.attributedText = attributedString
        
        eventDate.text = event.dateEvent
        eventTime.text = event.strTime
    }
    
}








