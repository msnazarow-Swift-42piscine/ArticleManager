//
//  ArticleManager.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import CoreData

public class ArticleManager {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "article",bundle: Bundle(for: type(of: self)))
        container.loadPersistentStores { _ , error in
            guard let error = error else { return }
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
        return container
    }()

    private lazy var context = persistentContainer.viewContext

    public init() {}

    public func save () {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
    }

    public func newArticle(title: String? = nil, content: String? = nil, image: UIImage? = nil) -> Article {
        let article = Article(context: context)
        article.title = title
        article.content = content
        article.image = image?.pngData()
        article.creationDate = Date()
        article.modificationDate = Date()
        article.language = Locale.current.languageCode
        return article
    }

    public func getAllArticles() -> [Article] {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        var articles: [Article] = []
        do {
            try articles.append(contentsOf: context.fetch(request))
        } catch {
            print(error.localizedDescription)
        }
        return articles
    }

    public func getArticles(withLang lang: String) -> [Article] {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        request.predicate = NSPredicate(format: "language = %@", lang)
        var articles: [Article] = []
        do {
            try articles.append(contentsOf: context.fetch(request))
        } catch {
            print(error.localizedDescription)
        }
        return articles
    }

    public func getArticles(containString str: String) -> [Article] {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        request.predicate = NSPredicate(format: "(title CONTAINS[str] %@) OR (content CONTAINS[str] %@)", str)
        var articles: [Article] = []
        do {
            try articles.append(contentsOf: context.fetch(request))
        } catch {
            print(error.localizedDescription)
        }
        return articles
    }

    public func removeArticle(article: Article){
        context.delete(article)
    }
}
