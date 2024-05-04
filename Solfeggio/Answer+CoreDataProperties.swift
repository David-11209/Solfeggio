//
//  Answer+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//
//

import Foundation
import CoreData

extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var name: String?
    @NSManaged public var rightAnswer: Bool
    @NSManaged public var task: Task?

}

extension Answer: Identifiable {

}
