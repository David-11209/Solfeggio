//
//  Theme+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//
//

import Foundation
import CoreData

extension Theme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Theme> {
        return NSFetchRequest<Theme>(entityName: "Theme")
    }

    @NSManaged public var name: String?
    @NSManaged public var block: Block?
    @NSManaged public var levels: Set<Level>

}

// MARK: Generated accessors for levels
extension Theme {

    @objc(addLevelsObject:)
    @NSManaged public func addToLevels(_ value: Level)

    @objc(removeLevelsObject:)
    @NSManaged public func removeFromLevels(_ value: Level)

    @objc(addLevels:)
    @NSManaged public func addToLevels(_ values: NSSet)

    @objc(removeLevels:)
    @NSManaged public func removeFromLevels(_ values: NSSet)

}

extension Theme: Identifiable {

}
