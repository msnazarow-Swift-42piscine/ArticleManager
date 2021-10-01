//
//  TestRouter.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class TestRouter: PresenterToRouterTestProtocol {

    // MARK: - Properties
    weak var view: UIViewController!

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
}
