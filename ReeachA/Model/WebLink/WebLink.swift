//
//  WebLink.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/27.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class WebLink: NSObject {
    
    var urlStr:String = ""
    var url:URL? { return urlStr.url }
    var title:String = ""
    var icon:UIImage?
    
    convenience init(urlStr:String, title:String, icon:UIImage?) {
        self.init()
        self.urlStr = urlStr
        self.title = title
        self.icon = icon
    }
    
    var isTwitter: Bool {
        return urlStr.contains("twitter.com")
    }
    var isWikipedia: Bool {
        return urlStr.contains("wikipedia.org")
    }
    var isInstagram: Bool {
        return urlStr.contains("instagram.com")
    }
    
}
