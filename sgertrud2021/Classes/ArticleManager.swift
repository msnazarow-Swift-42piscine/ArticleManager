//
//  ArticleManager.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import CoreData

public class ArticleManager {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "article", bundle: Bundle(for: type(of: self)))
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
        article.modificationDate = article.creationDate
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
        request.predicate = NSPredicate(format: "(title CONTAINS[cd] %@) OR (content CONTAINS[cd] %@)", str, str)
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

    public func removeArticles(articles: [Article]){
        articles.forEach{ context.delete($0) }
    }

    public func removeAllArticles(){
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        do {
            let articles = try context.fetch(request)
            articles.forEach{ removeArticle(article: $0) }
        } catch let error {
            print("Error while delete data: \(error)")
        }
    }
}
