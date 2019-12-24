//
//  ChannelDetailTopViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

/// Channelを持っている（どこかに移動したい）
protocol HaveChannel: class {
    var channel: Channel? { get set }
}

/// 子ViweConrollerに適用
protocol ChannelDetailTopChild: UIViewController {
    var parentChannelDetailTopViewController: ChannelDetailTopViewController? { get }
    var headerHeight: CGFloat { get set }
}
extension ChannelDetailTopChild {
    var parentChannelDetailTopViewController: ChannelDetailTopViewController? {
        if isViewLoaded {
            return view.superview?.viewController as? ChannelDetailTopViewController
        }
        else {
            return nil
        }
    }
}

class ChannelDetailTopViewController: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var screenWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerTop: NSLayoutConstraint!
    @IBOutlet weak var barLeft: NSLayoutConstraint!
    @IBOutlet weak var screenStackView: UIStackView!
    @IBOutlet weak var baseInfoContainerView: UIView!
    @IBOutlet weak var tabButtonStackView: UIStackView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet var barBaseView: [UIView]!
    @IBOutlet var barLabels: [UILabel]!


    //MARK:- ChannelDetailTimelineViewController

    // header
    var baseInfoVC: ChannelDetailTopBaseInfoViewController? {
        return children.first(where: { $0 is ChannelDetailTopBaseInfoViewController} ) as? ChannelDetailTopBaseInfoViewController
    }
    // スライド
    var linkVC: ChannelDetailLinkViewController? {
        return children.first(where: { $0 is ChannelDetailLinkViewController} ) as? ChannelDetailLinkViewController
    }
    var timelineVC: ChannelDetailTimelineViewController? {
        return children.first(where: { $0 is ChannelDetailTimelineViewController} ) as? ChannelDetailTimelineViewController
    }
    var mediaVC: ChannelDetailMediaViewController? {
        return children.first(where: { $0 is ChannelDetailMediaViewController} ) as? ChannelDetailMediaViewController
    }
    var infoVC: ChannelDetailInfoViewController? {
        return children.first(where: { $0 is ChannelDetailInfoViewController} ) as? ChannelDetailInfoViewController
    }
    var relationVC: ChannelDetailRelationViewController? {
        return children.first(where: { $0 is ChannelDetailRelationViewController} ) as? ChannelDetailRelationViewController
    }

    var allChildren: [UIViewController?] {
        return [baseInfoVC, linkVC, timelineVC, mediaVC, relationVC, infoVC]
    }
    var slideScreens: [UIViewController?] {
        return [linkVC, timelineVC, mediaVC, relationVC, infoVC]
    }


    var channel:Channel {
        get {
            return (self.tabBarController as! ChannelDetailTabBarController).channel
        }
        set {
            //TODO: Notification使う？
            (self.tabBarController as! ChannelDetailTabBarController).channel = newValue
        }
    }
    var anime:Anime {
        return channel as! Anime
    }

    var screenCount: Int {
        return screenStackView.arrangedSubviews.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenWidthConstraint.constant = view.frame.width

        channel = Anime()
        (channel as! Anime).createSample()

        print("🤔ChannelDetailTopViewController viewDidLoad")
//        baseInfoVC?.channel = channel
//        linkVC?.channel = channel
//        timelineVC?.channel = channel
        allChildren.forEach { (haveChannel: UIViewController?) in
            if let haveChannel = haveChannel as? HaveChannel {
                haveChannel.channel = self.channel
            }
        }

        barBaseView.forEach{ $0.backgroundColor = channel.style.backColor }
        barView.backgroundColor = channel.style.keyColor
        
        self.navigationController?.title = "かぐや様は告らせたい"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        print("viewDidLayoutSubviews")

        slideScreens.forEach { (viewController: UIViewController?) in
            if let vc = viewController as? ChannelDetailTopChild {
                vc.headerHeight = self.baseInfoContainerView.bounds.height + tabButtonStackView.bounds.height
            }
        }
    }

    var isViewDidAppear: Bool = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isViewDidAppear = true
    }

}

extension ChannelDetailTopViewController {
    /// これは子ViewControllerを対象にしている
    func scrollViewDidScroll(viewController: UIViewController, scrollView: UIScrollView) {
        guard isViewDidAppear else {
            return
        }
        
        let scrollWithContentInset = scrollView.contentOffset.y + scrollView.contentInset.top
//        print(scrollWithContentInset)

        let headerheight: CGFloat = baseInfoVC?.view?.bounds.height ?? 0
        headerTop.constant = min(0, max(-headerheight, -scrollWithContentInset))

        print("😀  \(isViewLoaded) \(min(0, max(-headerheight, -scrollWithContentInset)))")
    }
}

extension ChannelDetailTopViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        barLeft.constant = scrollView.contentOffset.x / screenCount.f

        let page = Int((scrollView.contentOffset.x + scrollView.bounds.width/2.0)/scrollView.bounds.width)
        if page < slideScreens.count {
            barLabels.forEach{ $0.textColor =  channel.style.unSelectColor }
            barLabels[page].textColor = channel.style.keyColor
        }
    }
}

/*

    
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
        case basic
        case copyright
        case links
        case staff
        case cast
    }
    
    func sections() -> [Section] {
        return [/*.title,*/ .summary, /*.copyright,*/.basic, .links, .staff, .cast]
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
            cell.setup(anime: anime)
            return cell
        case .basic:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopBasicInfoTableViewCell.self, for: indexPath)
            cell.setup(anime: anime)
            return cell
        case .copyright:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopCopyrightTableViewCell.self, for: indexPath)
            cell.setup(channel: anime)
            return cell
        case .links:
            let cell = tableView.dequeueReusableCell(with: ChannelDetailTopLinkTableViewCell.self, for: indexPath)
            cell.setup(anime: anime)
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
*/

