//
//  WeekModel.swift
//  WeekCalendarExample
//
//  Created by 長内幸太郎 on 2019/06/02.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit
import SwiftDate

class WeekModel: NSObject {
    // 日曜日を開始とする

    var days: [DayModel] = []

    init(firstDayModel:DayModel) {
        days.append(firstDayModel)
        for i in 1...6 {
            days.append(DayModel(date: firstDayModel.date + i.days))
        }
    }

    init(beforeWeekModel:WeekModel) {
        days = beforeWeekModel.days.map { $0.nextWeek() }
    }

    var isCurrentWeek: Bool {
        for dayModel in days {
            if dayModel.date.isToday {
                return true
            }
        }
        return false
    }

}

extension WeekModel {
    static func create100year() -> [WeekModel] {

        var result: [WeekModel] = []

        let firstWeekModel = WeekModel(firstDayModel: DayModel(dayFrom1970: 3))
        var wkWeekModel = firstWeekModel
        result.append(firstWeekModel)

        for _ in 0 ... 5300 {
            let wk = WeekModel(beforeWeekModel: wkWeekModel)
            result.append(wk)
            wkWeekModel = wk
        }

        return result
    }
}
