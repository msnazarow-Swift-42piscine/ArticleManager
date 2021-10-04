//
//  TestInteractor.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import ArticleManager

class TestInteractor: PresenterToInteractorTestProtocol {
    let manager = ArticleManager.shared

    func getExample() {
        manager.newArticle(title: "Hello Dolly", content: "I am the cleverst sheep in the world")
        manager.newArticle(title: "Hello Bully", content: "Never never let you go")
        manager.newArticle(title: "Goodbay Dolly", content: "Goodbuy my love goodbye")
        manager.newArticle(title: "Goodbay Bully", content: "I ain't gonna be just a face in the crowd")
        print(manager.getArticles(containString: "let"))
        manager.removeArticles(articles: manager.getArticles(containString: "gonna"))
        print(manager.getAllArticles())
        manager.save()
    }
}
