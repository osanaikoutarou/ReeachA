//
//  AnimeChannelCollectionViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class AnimeChannelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
    
    static func cellSize(collectionViewWidth:CGFloat, column:CGFloat, margin:CGFloat, horizontalInset:CGFloat) -> CGSize {
        let horizontalArea = collectionViewWidth - margin * column.minus(1) - horizontalInset * 2.f
        let width = horizontalArea / column - 1.f
        let imgSize:CGSize = CGSize(width: width, height: 1199.f/852.f * width)
        let labelHeight = 45.f
        return CGSize(width: width, height: imgSize.height + labelHeight)
    }

}

extension AnimeChannelCollectionViewCell {
    func setup(anime:Anime) {
        titleLabel.text = anime.name
        imageView.image = UIImage(named: "yakusokuno")
    }
}
