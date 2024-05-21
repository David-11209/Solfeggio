//
//  SoundTask+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 21.05.2024.
//
//

import Foundation
import CoreData


extension SoundTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SoundTask> {
        return NSFetchRequest<SoundTask>(entityName: "SoundTask")
    }

    @NSManaged public var id: String?
    @NSManaged public var soundName: String?
    @NSManaged public var soundTest: NSSet?
    @NSManaged public var answers: NSOrderedSet?

}

// MARK: Generated accessors for soundTest
extension SoundTask {

    @objc(addSoundTestObject:)
    @NSManaged public func addToSoundTest(_ value: SoundTest)

    @objc(removeSoundTestObject:)
    @NSManaged public func removeFromSoundTest(_ value: SoundTest)

    @objc(addSoundTest:)
    @NSManaged public func addToSoundTest(_ values: NSSet)

    @objc(removeSoundTest:)
    @NSManaged public func removeFromSoundTest(_ values: NSSet)

}

// MARK: Generated accessors for answers
extension SoundTask {

    @objc(insertObject:inAnswersAtIndex:)
    @NSManaged public func insertIntoAnswers(_ value: Answer, at idx: Int)

    @objc(removeObjectFromAnswersAtIndex:)
    @NSManaged public func removeFromAnswers(at idx: Int)

    @objc(insertAnswers:atIndexes:)
    @NSManaged public func insertIntoAnswers(_ values: [Answer], at indexes: NSIndexSet)

    @objc(removeAnswersAtIndexes:)
    @NSManaged public func removeFromAnswers(at indexes: NSIndexSet)

    @objc(replaceObjectInAnswersAtIndex:withObject:)
    @NSManaged public func replaceAnswers(at idx: Int, with value: Answer)

    @objc(replaceAnswersAtIndexes:withAnswers:)
    @NSManaged public func replaceAnswers(at indexes: NSIndexSet, with values: [Answer])

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: Answer)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: Answer)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSOrderedSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSOrderedSet)

}

extension SoundTask : Identifiable {

}
