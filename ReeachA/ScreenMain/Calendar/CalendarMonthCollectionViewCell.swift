//
//  CalendarMonthCollectionViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2020/08/16.
//  Copyright © 2020 長内幸太郎. All rights reserved.
//

import UIKit

class CalendarMonthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
 
    override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CalendarMonthCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6*7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CalendarDayCollectionViewCell.self, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ceil(UIScreen.main.bounds.width/7.0) - 1
        return CGSize(width: width, height: width)
    }
}
