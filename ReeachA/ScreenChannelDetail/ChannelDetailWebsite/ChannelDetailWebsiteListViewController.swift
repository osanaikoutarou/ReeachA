//
//  ChannelDetailWebsiteListViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/27.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailWebsiteListViewController: UIViewController {
    
    var webLinks:[WebLink] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(cellType: ChannelDetailWebsiteListTableViewCell.self)
        
        
        let webLink1 = WebLink()
        webLink1.urlStr = "https://neverland-anime.com/"
        webLink1.title = "アニメ公式サイト"
        webLinks.append(webLink1)
        
        let webLink3 = WebLink()
        webLink3.urlStr = "https://twitter.com/yakuneba_staff?lang=ja"
        webLink3.title = "Twitter 公式"
        webLink3.icon = UIImage(named: "Twitter_Logo_Blue")
        webLinks.append(webLink3)
        
        let webLink4 = WebLink()
        webLink4.urlStr = "https://www.instagram.com/neverland_anime/"
        webLink4.title = "Instagram 約束のネバーランド"
        webLink4.icon = UIImage(named: "icon_instagram")
        webLinks.append(webLink4)

        let webLink2 = WebLink()
        webLink2.urlStr = "https://ja.wikipedia.org/wiki/%E7%B4%84%E6%9D%9F%E3%81%AE%E3%83%8D%E3%83%90%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89"
        webLink2.title = "wikipedia 約束のネバーランド"
        webLink2.icon = UIImage(named: "icon_wikipedia")
        webLinks.append(webLink2)

        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ChannelDetailWebsiteListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChannelDetailWebsiteListTableViewCell.self, for: indexPath)
        cell.setup(webLink: webLinks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let webLink = webLinks[indexPath.row]
        if webLink.isTwitter {
            UIApplication.shared.open("twitter://user?screen_name=yakuneba_staff".url! , options: [:], completionHandler: { (success) in
                if !success {
                    self.performSegue(withIdentifier: "ChannelDetailWebsite", sender: webLink)
                }
            })
        }
        else if webLink.isWikipedia {
            UIApplication.shared.open("wikipedia://ja.wikipedia.org/wiki/%E7%B4%84%E6%9D%9F%E3%81%AE%E3%83%8D%E3%83%90%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89".url! , options: [:]) { (success) in
                if !success {
                    self.performSegue(withIdentifier: "ChannelDetailWebsite", sender: webLink)
                }
            }
        }
        else if webLink.isInstagram {
            UIApplication.shared.open("instagram://user?username=neverland_anime", options: [:]) { (success) in
                if !success {
                    self.performSegue(withIdentifier: "ChannelDetailWebsite", sender: webLink)
                }
            }
        }
        else {
            self.performSegue(withIdentifier: "ChannelDetailWebsite", sender: webLink)
        }
    }
    
}

extension ChannelDetailWebsiteListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChannelDetailWebsite" {
            let vc = segue.destination as! ChannelDetailWebsiteViewController
            vc.webLink = sender as? WebLink
        }
    }
}
