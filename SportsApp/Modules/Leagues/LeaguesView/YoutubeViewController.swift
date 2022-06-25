//
//  YoutubeViewController.swift
//  SportsApp
//
//  Created by Mohamed Makhlouf Ahmed on 22/06/2022.
//

import UIKit
import WebKit

class YoutubeViewController: UIViewController {

    var link = ""
    @IBOutlet weak var youTubeView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "https://\(link)")
        youTubeView.load(URLRequest(url: url!))
    }
}
