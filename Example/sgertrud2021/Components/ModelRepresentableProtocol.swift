//
//  ModelRepresentableProtocol.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

protocol ModelRepresentable {
    var model: Identifiable? { get set }
}

protocol Identifiable {
    var identifier: String { get }
}
