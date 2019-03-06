//
//  YoutubeView.swift
//  ReeachA
//
//  Created by osanai on 2019/03/06.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit

class YoutubeView: UIView {
    
    var contentView: UIView!
    @IBOutlet weak var wkwebview: WKWebView!
    @IBOutlet weak var loadingImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakefromnib")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func commonInit() {
        let className = String(describing: type(of: self))
        contentView = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView
        addSubview(contentView)
        contentView.frame = self.frame
        contentView.bindFrameToSuperviewBounds()
    }
    
    func load(id: String) {
        let url = URL(string: "https://www.youtube.com/embed/" + id)!
        wkwebview.load(URLRequest(url: url))
        wkwebview.setup
    }
}
