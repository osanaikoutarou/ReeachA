//
//  DayModel.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit
import SwiftDate

class DayModel: NSObject {

    var date: Date

    func calendar() -> Calendar {
        return Calendar(identifier: .gregorian)
    }
    func date1970() -> Date {
        return Date(timeIntervalSince1970: 0)
    }

    var dayFrom1970: Int {
        return calendar().dateComponents([.day], from: date1970(), to: date).day ?? 0
    }

    init(date: Date) {
        self.date = date
    }
    init(dayFrom1970: Int) {
        self.date = Date(timeIntervalSince1970: 0) + dayFrom1970.days
//        print("a - \(dayFrom1970)")
//        self.date = Calendar(identifier: .gregorian).date(byAdding: .day, value: dayFrom1970, to: Date(timeIntervalSince1970: 0))!
//        print("b - \(self.date)")
        print(self.date.dayString)
    }

    func nextWeek() -> DayModel {
        return DayModel(date: date + 1.weeks)
    }

}
