//
//  SoundTest+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 21.05.2024.
//
//

import Foundation
import CoreData

extension SoundTest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SoundTest> {
        return NSFetchRequest<SoundTest>(entityName: "SoundTest")
    }

    @NSManaged public var name: String?
    @NSManaged public var soundTasks: Set<SoundTask>

}

// MARK: Generated accessors for soundTasks
extension SoundTest {

    @objc(insertObject:inSoundTasksAtIndex:)
    @NSManaged public func insertIntoSoundTasks(_ value: SoundTask, at idx: Int)

    @objc(removeObjectFromSoundTasksAtIndex:)
    @NSManaged public func removeFromSoundTasks(at idx: Int)

    @objc(insertSoundTasks:atIndexes:)
    @NSManaged public func insertIntoSoundTasks(_ values: [SoundTask], at indexes: NSIndexSet)

    @objc(removeSoundTasksAtIndexes:)
    @NSManaged public func removeFromSoundTasks(at indexes: NSIndexSet)

    @objc(replaceObjectInSoundTasksAtIndex:withObject:)
    @NSManaged public func replaceSoundTasks(at idx: Int, with value: SoundTask)

    @objc(replaceSoundTasksAtIndexes:withSoundTasks:)
    @NSManaged public func replaceSoundTasks(at indexes: NSIndexSet, with values: [SoundTask])

    @objc(addSoundTasksObject:)
    @NSManaged public func addToSoundTasks(_ value: SoundTask)

    @objc(removeSoundTasksObject:)
    @NSManaged public func removeFromSoundTasks(_ value: SoundTask)

    @objc(addSoundTasks:)
    @NSManaged public func addToSoundTasks(_ values: NSOrderedSet)

    @objc(removeSoundTasks:)
    @NSManaged public func removeFromSoundTasks(_ values: NSOrderedSet)

}

extension SoundTest: Identifiable {

}
