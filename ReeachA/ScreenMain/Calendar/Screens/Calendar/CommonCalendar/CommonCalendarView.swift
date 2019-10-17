//
//  CommonCalendarView.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CommonCalendarView: UIView {
    var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 1, height: 1), collectionViewLayout: CommonCalendarLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: CommonCalendarDayCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.bindFrameToSuperviewBounds()
    }
}

extension CommonCalendarView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CommonCalendarDayCollectionViewCell.self, for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = ceil(UIScreen.main.bounds.width/7.0)
        return CGSize(width: w, height: w)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

}

class CommonCalendarLayout: UICollectionViewFlowLayout {
    override func awakeFromNib() {
//        itemSize = CGSize(width: 63, height: 63)
        sectionInset = .zero
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .vertical
    }
}
