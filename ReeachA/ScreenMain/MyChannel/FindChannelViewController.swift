//
//  FindChannelViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class FindChannelViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: AnimeChannelCollectionViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension FindChannelViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func margin() -> (horizontal:CGFloat, vertical:CGFloat) {
        return (10,10)
    }
    func columnNum() -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: AnimeChannelCollectionViewCell.self, for: indexPath)
        
        let anime = Anime()
        anime.name = "約束のネバーランド"
        cell.setup(anime: anime)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let scale = (self.view.width - margin().horizontal * (columnNum() - 1.f)) / columnNum() / AnimeChannelCollectionViewCell.sizeDefault.width
//        return AnimeChannelCollectionViewCell.sizeDefault.scale(scale)
        return AnimeChannelCollectionViewCell.cellSize(collectionViewWidth: self.view.frame.width, column: 3.f, margin: 10.f, horizontalInset: 10.f)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10.f, bottom: 0, right: 10.f)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin().horizontal
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin().vertical
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ChannelDetail", sender: nil)
    }
    
}

extension FindChannelViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChannelDetail" {
            let vc = segue.destination
            vc.hidesBottomBarWhenPushed = true
        }
    }
}
