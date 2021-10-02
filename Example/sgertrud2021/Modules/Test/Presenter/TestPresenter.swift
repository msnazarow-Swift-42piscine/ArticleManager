//
//  TestPresenter.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import sgertrud2021

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
        let manager = ArticleManager()
        manager.newArticle(title: "Hello Dolly", content: "I am the cleverst sheep in the world")
        manager.newArticle(title: "Hello Bully", content: "Never never let you go")
        manager.newArticle(title: "Goodbay Dolly", content: "Goodbuy my love goodbye")
        manager.newArticle(title: "Goodbay Bully", content: "I ain't gonna be just a face in the crowd")
        manager.save()
        print(manager.getAllArticles())
    }
}

extension TestPresenter: CellToPresenterTestProtocol {
    
}
