//
//  ArticleManager.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import CoreData

public class ArticleManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "article",bundle: Bundle(for: type(of: self)))
        container.loadPersistentStores { _ , error in
            guard let error = error else { return }
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
    }
}
