//
//  NSPersistentContainer+Ext.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import CoreData

extension NSPersistentContainer {
    public convenience init(name: String, bundle: Bundle) {
        guard let modelURL = bundle.url(forResource: name, withExtension: "momd"),
            let mom = NSManagedObjectModel(contentsOf: modelURL)
            else {
                fatalError("Unable to located Core Data model")
        }
        self.init(name: name, managedObjectModel: mom)
    }
}
