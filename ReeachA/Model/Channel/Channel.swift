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
    case human
    // man
    // organization
    // information
}

enum Original {
    case unknown
    case original
    case comic
    
    var description:String {
        switch self {
        case .unknown:
            return ""
        case .original:
            return "オリジナル"
        case .comic:
            return "漫画"
        }
    }
}

// 通常の情報も扱う
class Channel: NSObject {
    var channelable:Bool = false
    
    var id:String = ""
    var name:String = ""                // 表示名
    var positionName:String = ""        // ポジション、役名など
    var type:ChannelType = .none
    var officialUrl:String = ""         // 公式サイトのURL
    var wikipedia:String = ""           // wikipediaのURL
    var twitterScreenName:String = ""   // Twitter
    
    var topImageURL:String = ""
    var descriptionText:String = ""
    var isFollow:Bool = false
//    var statesType:StatesType?
    var copyright:String = ""           // コピーライト
    var publicDay:String = ""           // 公開
    var original:Original = .unknown    // オリジナル
    var author:String = ""              // 原作者
    
    var tags:[String] = []
    
//    var sigInfos:[String] = []
//    var relatedChannels:[Channel] = []
}
