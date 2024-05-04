//
//  CoreDataManager.swift
//  Solfeggio
//
//  Created by Давид Васильев on 03.05.2024.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func saveContext()
    func obtainAllData() -> [Block]
}

class CoreDataManager: CoreDataManagerProtocol {

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Solfeggio")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func obtainAllData() -> [Block] {
        let fetchRequest = Block.fetchRequest()
        do {
            let results = try viewContext.fetch(fetchRequest)
            return results
        } catch {
            print("Ошибка при получении данных из CoreData: \(error)")
        }
        return []
    }
}
