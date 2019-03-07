//
//  YoutubeTableViewCell.swift
//  ReeachA
//
//  Created by osanai on 2019/03/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit

class YoutubeTableViewCell: UITableViewCell {
    @IBOutlet weak var wkwebview: WKWebView!
    
    @IBOutlet weak var youtubeView: YoutubeView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setup() {
//        wkwebview.load(URLRequest(url: URL(string: "https://www.youtube.com/embed/Ywq4XR0G4Qk")!))
//        wkwebview.scrollView.isScrollEnabled = false
        
        youtubeView.load(id: "Ywq4XR0G4Qk")

    }

}
