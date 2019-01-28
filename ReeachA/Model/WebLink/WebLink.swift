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
    
    var isTwitter: Bool {
        return urlStr.contains("twitter.com")
    }
    var isWikipedia: Bool {
        return urlStr.contains("wikipedia.org")
    }
    
}
