//
//  CalendarDayCollectionViewCell.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/29.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CalendarDayScheduleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dayView: UIView!
    var shadowView: ShadowView?

//    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }

    func addShadow() {
        if shadowView != nil {
            return
        }

        layoutIfNeeded()
        shadowView = ShadowView()

        shadowView!.translatesAutoresizingMaskIntoConstraints = true
        shadowView!.frame = dayView.frame

        shadowView!.addShadow(shadowColor: .black,
                             shadowOffset: CGSize(width: 0, height: 2),
                             shadowOpacity: 0.1,
                             shadowRadius: 10,
                             cornerRadius: dayView.layer.cornerRadius)

        self.insertSubview(shadowView!, at: 0)
    }

    func setup(dayModel: DayModel) {
        let hoge = Date.dateToString(dayModel.date)
//        dateLabel.text = hoge
    }
    
}

extension CalendarDayScheduleCollectionViewCell: UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CalendarDayEventTableViewCell.self, for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
