//
//  ChannelDetailTopViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        descriptionTextView.removePadding()
//        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        self.navigationController?.isNavigationBarHidden = true
//        addHogeButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
//    func addHogeButton() {
//        let button = UIButton.init(type: .system)
//        button.setTitle("hoge", for: .normal)
//        button.addAction(for: .touchUpInside) {
////            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
////            self .show(vc!, sender: nil)
//        }
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = barButtonItem
//    }
    
    @IBAction func tappedStates(_ sender: Any) {
        dispActionSheet(title: nil, message: "今の状態を選択してください", actions: [
            UIAlertAction(title: "未視聴", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "未視聴：見たいけど見れない", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "未視聴：見るつもり", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "視聴中：やめた・保留", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "視聴中：継続", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "視聴済：見終わった", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "その他", style: .default, handler: { (action) in
                
            }).alignLeft(),
            UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action) in
                
            }).alignLeft(),

            ])
    }
    
    
    
}

/*
 MyAnimeList
 
 最新の放送
 TYPE　TV
 Episode　12話
 PREMIRED　Winter2019
 STUDIO　動画工房
 Genre　Comedy,Slice of Life
 Score
 Rank
 Popularety
 
 放送 2019年1月から (2019-Winter)
 全12話
 
 原作 漫画
   原作・原案　白井カイウ、出水ぽすか　作画 宮崎周平
 アニメーション制作　CloverWorks
 監督　押戸守
 
 
 
 */



/*
 
 ゾンビランドサガスレ　テンプレ
 
 ●放送＆配信情報
 AbemaTV：2018年10月4日（木）より毎週木曜日 23:30～ ※止まる人はChrome以外のブラウザを推奨
 AT-X：2018年10月4日（木）より毎週木曜日 23:30～
 TOKYO MX：2018年10月4日（木）より毎週木曜日 24:00～
 サンテレビ：2018年10月4日（木）より毎週木曜日 24:00～
 BS11：2018年10月4日（木）より毎週木曜日 24:30～
 サガテレビ：2018年10月5日（金）より毎週金曜日 25:25～
 TVQ九州放送：2018年10月5日（金）より毎週金曜日 26:58～
 ●関連サイト
 公式サイト：http://zombielandsaga.com/
 公式Twitter：http://twitter.com/zombielandsaga
 
 
 
 〇スタッフ
 原作：広報広聴課ゾンビ係
 監督：境 宗久
 シリーズ構成： 村越 繁
 キャラクターデザイン：深川 可純
 美術監督：小倉 一男
 撮影監督：柳田 貴志
 色彩設計：佐々木 梓
 編集：後藤 正浩
 音楽：高梨 康治
 音楽制作：エイベックス・ピクチャーズ
 音響監督：境 宗久
 音響制作：dugout
 アニメーション制作：MAPPA
 
 〇キャスト
 巽 幸太郎：宮野 真守
 源 さくら：本渡 楓
 二階堂 サキ：田野 アサミ
 水野 愛：種田 梨沙
 紺野 純子：河瀬 茉希
 ゆうぎり：衣川 里佳
 星川 リリィ：田中 美海
 山田 たえ：三石 琴乃
 警察官Ａ：吉野 裕行
 ロメロ：高戸 靖広
 
 
 
 
 ●主題歌
 OPテーマ『徒花ネクロマンシー』
 https://www.you tube.com/watch?v=yDXVqicnWeo
 EDテーマ『光へ』
 https://www.you tube.com/watch?v=Yny1Z5v7A2c
 挿入歌テーマ『FANTASTIC LOVERS』
 https://www.you tube.com/watch?v=cU2mTOgz9pA
 ※youtubeのリンクはNGワードにあたる為、スペースを挿入しています
 ●コミカライズ
 https://cycomi.com/fw/cycomibrowser/chapter/title/95
 ●関連スレ
 ゾンビランドサガ百合カップリングスレ
 https://mao.5ch.net/test/read.cgi/anichara/1541691399/
 ●キャラスレ、
 【ゾンビランドサガ】源さくらはどやんすかわいい なん2ってー
 https://matsuri.5ch.net/test/read.cgi/anichara2/1543083804/
 
 
 
 
 ●佐賀マップ
 
 
 
 ●ドライブイン鳥CM ゾンビランドサガ版。
 https://twi tter.com/i/status/1059762425870729216
 
 ●アニメイトタイムズ・ゾンビランドサガ最新情報
 (水曜夕方：先行カット、土曜夕方：キャスト座談会、ほか)
 https://www.animatetimes.com/tag/details.php?id=7342&subids=1392
 
 
 
 
 ●既出の聖地等（初出）　<特定待ち>
 01話　唐津市/唐津市歴史民俗資料館、町田川　佐賀市/ライブハウスGEILS
 02話　佐賀市/寿通り商店街（解体済）、佐賀城鯱の門、同ふれあいコンサート
 03話　唐津市/唐津駅、唐津市歴史民俗資料館緑地
 04話　嬉野市/華翠苑、シーボルトの湯、豊玉姫神社（なまず様）、風月堂、阿部家具店、cafe moka、広川鮮魚店、旅館千鳥、湯宿広場（足湯）
 05話　伊万里市/ドライブイン鳥　鹿島市/ガタリンピック
 06話　唐津市/西の浜、山崎団地児童遊園　鳥栖市/鳥栖スタジアム
 07話　佐賀市/嘉瀬川河川敷のサガロックフェスティバル（架空のイベント）
 08話　佐賀市/656広場、イオンモール佐賀大和、三溝公園（パピィ昼飯）、神野公園（花見）、佐賀県立美術館・博物館（土木展）　嬉野市/嬉野温泉夏祭り
 ●アイキャッチ
 01話　古伊万里浪漫、佐賀県地図
 02話　たまねぎ（白石町）、鍋島直正像（佐賀市）
 03話　ミルクック、ブラックモンブラン、さがほのか
 04話　茶摘み（嬉野市）、嘉瀬川河川敷（佐賀市）のバルーンフェスタ
 05話　牧のうどん（伊万里市）、唐津くんち（唐津市）
 06話　さが美人（みかん）、さが錦
 07話　伊万里湾大花火（伊万里市）、Cygames佐賀ビル（仮称）
 08話　シシリアンライス、アスパラガス
 ●聖地巡礼マップ
 https://drive.google.com/open?id=18kIMdxeHeBXFRJY-8j7_D9K5pLeZPu__&usp=sharing
 
 
 
 ☆イベント情報
 マチ★アソビCAFE 東京/大阪/眉山/北九州 コラボカフェ
 10/23（火）～12/2（日） http://machiasobi.com/machiasobicafe/collabo/zls/
 
 ポップアップストア in AKIHABARAゲーマーズ本店
 11月20日(火) ～ 12月2日(日) https://zombielandsaga.com/news/detail.php?id=1066864
 
 秋葉原スタンプラリー開催
 11月20日(火)～12月2日(日) https://zombielandsaga.com/news/detail.php?id=1066872
 
 カラオケアドアーズ秋葉原店コラボメニュー＆ルーム
 11月20日（火）～12月20日（木） https://www.adores.jp/akiba-karaoke/c55_zombielandsaga.html
 
 CygamesFes2018 トーク＆LIVE ゾンビランドサガ～フランシュシュといっしょ～
 12月15日（土） 16:30～17:30 （生中継） https://zombielandsaga.com/news/detail.php?id=1067295
 
 聖地巡礼オフィシャルツアー
 2019/2/16(土)～17(日) https://zombielandsaga.com/news/detail.php?id=1067426
 
 ゾンビランドサガLIVE～フランシュシュみんなでおらぼう！～
 2019年 3月17日（日) https://zombielandsaga.com/event/detail.php?id=1070824
 
 
 
 

 
 */
