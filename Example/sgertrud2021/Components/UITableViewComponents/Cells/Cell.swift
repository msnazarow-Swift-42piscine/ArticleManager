//
//  Cell.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class Cell: UITableViewCell, ModelRepresentable {
    weak var presenter: CellToPresenterTestProtocol!

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
