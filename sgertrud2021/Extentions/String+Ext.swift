//
//  String+Ext.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .medium

        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
}
