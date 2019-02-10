//
//  Channel.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

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

class Channel: InfoAtom {
    
    var title:String = ""
    var positionName:String = ""        // ポジション、役名など
    var category:ChannelCategory = ChannelCategory()
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
