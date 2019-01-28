//
//  Channel.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

enum ChannelType {
    case none
    // content
    case anime
    case comic
    case webComic
    case music
    case video
    case event
    case caractor
    case otherContent   //まだまだある
    // man
    // organization
    // information
}

class Channel: NSObject {
    var id:String = ""                  // Account ID
    var name:String = ""                // Account name
    var type:ChannelType = .none
    var officialUrl:String = ""         // 公式サイトのURL
    var wikipedia:String = ""           // wikipediaのURL
    var twitterScreenName:String = ""   // Twitter
    
    var topImageURL:String = ""
    var descriptionText:String = ""
    var isFollow:Bool = false
//    var statesType:StatesType?
    var tags:[String] = []
    
//    var sigInfos:[String] = []
//    var relatedChannels:[Channel] = []
}
