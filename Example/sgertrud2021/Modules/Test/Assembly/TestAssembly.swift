//
//  TestAssembly.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum TestAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = TestViewController()
        let router = TestRouter(view: viewController)
        let interactor = TestInteractor()
        let dataSource = TestPresenterDataSource()
        let presenter = TestPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
