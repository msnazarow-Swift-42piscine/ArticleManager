//
//  TestPresenter.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class TestPresenter: ViewToPresenterTestProtocol {

    // MARK: Properties
    weak var view: PresenterToViewTestProtocol!
    let interactor: PresenterToInteractorTestProtocol
    let router: PresenterToRouterTestProtocol
    let dataSource:PresenterToDataSourceTestProtocol

    // MARK: Init
    init(view: PresenterToViewTestProtocol,
         interactor: PresenterToInteractorTestProtocol,
         router: PresenterToRouterTestProtocol,
         dataSource: PresenterToDataSourceTestProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad(){
        interactor.getExample()
    }
}

extension TestPresenter: CellToPresenterTestProtocol {
    
}
