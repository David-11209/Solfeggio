//
//  Task+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//
//

import Foundation
import CoreData

extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var task: String?
    @NSManaged public var image: String?
    @NSManaged public var level: Level?
    @NSManaged public var answers: Set<Answer>

}

// MARK: Generated accessors for answers
extension Task {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: Answer)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: Answer)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}

extension Task: Identifiable {

}
