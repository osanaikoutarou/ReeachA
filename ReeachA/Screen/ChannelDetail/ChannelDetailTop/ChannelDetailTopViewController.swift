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
    
    var channel:Channel {
        get {
            return (self.tabBarController as! ChannelDetailTabBarController).channel
        }
        set {
            (self.tabBarController as! ChannelDetailTabBarController).channel = newValue
        }
    }
    var anime:Anime {
        return channel as! Anime
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channel = Anime()
        (channel as! Anime).createSample()
        
        tableView.contentInsetAdjustmentBehavior = .never
        
//        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        self.navigationController?.isNavigationBarHidden = true
//        addHogeButton()
        
//        self.tabBarController?.addAnyButtonToRight(title: nil, image: UIImage(named: "icon_menu"), action: {
//
//        })
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(cellType: SectionHeaderBasicalTableCell.self)
        tableView.register(cellType: ChannelDetailWebsiteListTableViewCell.self)
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension ChannelDetailTopViewController {
    enum Section {
        case title
        case summary
        case copyright
        case staff
        case cast
    }
    
    func sections() -> [Section] {
        return [.title, .summary, .copyright, .staff, .cast]
    }
}

extension ChannelDetailTopViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections().count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections()[indexPath.section]
        
        switch section {
        case .title:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopTitleTableViewCell.self, for: indexPath)
            cell.titleLabel.text = channel.title
            return cell
        case .summary:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopSummaryTableViewCell.self, for: indexPath)
            cell.setup(infoPairs: anime.topInfos)
            return cell
        case .copyright:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopCopyrightTableViewCell.self, for: indexPath)
            cell.setup(channel: anime)
            return cell
        case .staff:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopInfoTableViewCell.self, for: indexPath)
            cell.setup(title: "スタッフ", infos: anime.staffs)
            return cell
        case .cast:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopInfoTableViewCell.self, for: indexPath)
            cell.setup(title: "キャスト", infos: anime.casts)
            return cell
        }
    }
}
