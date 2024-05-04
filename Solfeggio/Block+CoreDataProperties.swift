//
//  Block+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//
//

import Foundation
import CoreData

extension Block {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Block> {
        return NSFetchRequest<Block>(entityName: "Block")
    }

    @NSManaged public var name: String?
    @NSManaged public var themes: Set<Theme>

}

// MARK: Generated accessors for themes
extension Block {

    @objc(addThemesObject:)
    @NSManaged public func addToThemes(_ value: Theme)

    @objc(removeThemesObject:)
    @NSManaged public func removeFromThemes(_ value: Theme)

    @objc(addThemes:)
    @NSManaged public func addToThemes(_ values: NSSet)

    @objc(removeThemes:)
    @NSManaged public func removeFromThemes(_ values: NSSet)

}

extension Block: Identifiable {

}
