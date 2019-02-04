//
//  Anime.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class Anime: Channel {

    override init() {
        super.init()
        self.category.channelCategoryType = .anime
    }
    
    var topInfos:[InfoPair] = []
    var staffs:[InfoPair] = []
    var casts:[InfoPair] = []
}




extension Anime {
    
    func createSample() {
        topInfos.append(
            InfoPair(title: InfoAtom(name: "公開"),
                     contents: [InfoAtom(name: "2019年1月から"), InfoAtom(name: "全12話")]
        ))
        topInfos.append(
            InfoPair(title: InfoAtom(name: "原作"),
                     contents: [ChannelCategory(name: "漫画")]
        ))
        
        topInfos.append(
            InfoPair(title: InfoAtom(name: "原作・原案"),
                     contents: [Human(name: "白井カイウ"), Human(name: "出水ぽすか")]
        ))
        topInfos.append(
            InfoPair(title: InfoAtom(name: "作画"),
                     contents: [Human(name: "宮崎周平")]
        ))
        topInfos.append(
            InfoPair(title: InfoAtom(name: "アニメーション制作"),
                     contents: [Organization(name: "CloverWorks")]
        ))
        topInfos.append(
            InfoPair(title: InfoAtom(name: "監督"),
                     contents: [Human(name: "押戸守")]
        ))
        
        staffs.append(
            InfoPair(title: InfoAtom(name: "原作"),
                     contents: [Human(name: "白井カイウ"), Human(name: "出水ぽすか")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "監督"),
                     contents: [Human(name: "押戸守")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "シリーズ構成"),
                     contents: [Human(name: "大野敏哉")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "キャラクターデザイン"),
                     contents: [Human(name: "嶋田和晃")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "総作画監督"),
                     contents: [Human(name: "嶋田和晃")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "プロットデザイン"),
                     contents: [Human(name: "板井寛樹")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "音響監督"),
                     contents: [Human(name: "清水勝則")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "アニメーション制作"),
                     contents: [Organization(name: "CloverWorks")]
        ))
        staffs.append(
            InfoPair(title: InfoAtom(name: "製作"),
                     contents: [Organization(name: "「約束のネバーランド」製作委員会（アニプレックス、フジテレビジョン、集英社、CA-Cygamesアニメファンド、電通）")]
        ))
        // 残りは後で
        
        casts.append(
            InfoPair(title: InfoAtom(name: "ノーマン"),
                     contents: [Human(name: "内田真礼")]
        ))
        casts.append(
            InfoPair(title: InfoAtom(name: "ギルダ"),
                     contents: [Human(name: "Lynn")]
        ))
        casts.append(
            InfoPair(title: InfoAtom(name: "トーマ"),
                     contents: [Human(name: "日野まり")]
        ))
        casts.append(
            InfoPair(title: InfoAtom(name: "レイ"),
                     contents: [Human(name: "伊瀬茉莉也")]
        ))
        casts.append(
            InfoPair(title: InfoAtom(name: "フィル"),
                     contents: [Human(name: "河野ひより")]
        ))
        casts.append(
            InfoPair(title: InfoAtom(name: "ラニオン"),
                     contents: [Human(name: "森優子")]
        ))
        
        
//        原作 - 白井カイウ、出水ぽすか[8]
//        監督 - 神戸守[7]
//        シリーズ構成 - 大野敏哉[7]
//        キャラクターデザイン・総作画監督 - 嶋田和晃[7]
//        プロップデザイン - 板井寛樹[8]
//        美術設定 - 池田繁美、大久保修一、友野加世子、乗末美穂[8]
//        美術監督 - 池田繁美、丸山由紀子[8]
//        色彩設計 - 中島和子[8]
//        撮影監督 - 塩川智幸[8]
//        CG監督 - 福田陽[8]
//        編集 - 松原理恵[8]
//        音楽 - 小畑貴裕[7]
//        音楽制作 - アニプレックス、フジパシフィックミュージック
//        音響監督 - 清水勝則[8]
//        音楽プロデューサー - 舩橋宗寛
//        チーフプロデューサー - 三宅将典、高瀬透子
//        プロデューサー - 鈴木健太、尾崎紀子
//        アニメーションプロデューサー - 福島祐一
//        アニメーション制作 - CloverWorks[7]
//        制作 - 「約束のネバーランド」製作委員会（アニプレックス、フジテレビジョン、集英社、CA-Cygamesアニメファンド、電通）
    }
}
