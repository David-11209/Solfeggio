//
//  User+CoreDataProperties.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String
    @NSManaged public var login: String
    @NSManaged public var password: String
    @NSManaged public var image: Int16
    @NSManaged public var notesStat: Float
    @NSManaged public var intervalsStat: Float
    @NSManaged public var moodsStat: Float
    @NSManaged public var chordsStat: Float
    @NSManaged public var numberNotesListened: Int16
    @NSManaged public var numberIntervalsListened: Int16
    @NSManaged public var numberMoodsListened: Int16
    @NSManaged public var numberChordsListened: Int16
    @NSManaged public var numberNotesSuccessListened: Int16
    @NSManaged public var numberIntervalsSuccessListened: Int16
    @NSManaged public var numberMoodsSuccessListened: Int16
    @NSManaged public var numberChordsSuccessListened: Int16
}

extension User: Identifiable {

}
