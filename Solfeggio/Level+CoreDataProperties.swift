//
//  Level+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//
//

import Foundation
import CoreData

extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level")
    }

    @NSManaged public var id: String
    @NSManaged public var theme: Theme?
    @NSManaged public var tasks: Set<Task>

}

// MARK: Generated accessors for tasks
extension Level {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension Level: Identifiable {

}
