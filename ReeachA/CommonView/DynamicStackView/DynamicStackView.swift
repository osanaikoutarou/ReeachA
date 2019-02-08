//
//  DynamicStackView.swift
//  DynamicStackView
//
//  Created by osanai on 2019/02/07.
//  Copyright © 2019年 osanai. All rights reserved.
//

import UIKit

class DynamicStackView: UIStackView {
    var cells:[DynamicStackViewCell] {
        return self.arrangedSubviews as! [DynamicStackViewCell]
    }
    
    // Add
    func addCell(cell:DynamicStackViewCell) {
        self.addArrangedSubview(cell)
    }
    // Insert
    func insertCell(cell:DynamicStackViewCell, at index:Int) {
        insertArrangedSubview(cell, at: index)
    }
    // Remove
    func removeCell(index:Int) {
        if cells.count > index {
            let cell = cells[index]
            self.removeArrangedSubview(cell)
            cell.removeFromSuperview()
        }
    }
    func removeCell(cell:DynamicStackViewCell) {
        if cells.index(of: cell) != nil {
            self.removeArrangedSubview(cell)
            cell.removeFromSuperview()
        }
    }
    func removeLastCell() {
        if cells.count > 0 {
            removeCell(index: cells.count - 1)
        }
    }
    func removeAll() {
        for i in 0..<cells.count {
            removeCell(index: i)
        }
    }
    // Index
    func indexes(of cell:DynamicStackViewCell) -> [Int] {
        let equalCells = cells.filter { $0 == cell }
        let indexes = equalCells.map { cells.index(of: $0)! }
        return indexes
    }
    func index(of cell:DynamicStackViewCell) -> Int? {
        return indexes(of: cell).first
    }
}

extension DynamicStackView {
    func cell(with identifier:String) -> DynamicStackViewCell? {
        return cells.first { $0.identifier == identifier }
    }
}
