//
//  Article+CoreDataProperties.swift
//  
//
//  Created by out-nazarov2-ms on 02.10.2021.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: Data?
    @NSManaged public var creationDate: Date?
    @NSManaged public var modificationDate: Date?

    public override var description: String {
        """

        ================title: "\(title ?? "not initialized")"================
        content: "\(content ?? "not initialized")"
        language: "\(language!)"
        image: "\(image?.description ?? "not initialized")"
        creationDate: "\(creationDate!)"
        modificationDate: "\(modificationDate!)"
        """
    }
}
