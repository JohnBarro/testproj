//
//  Persistence.swift
//  Test Project Native ios
//
//  Created by John Nemesio Barro on 8/11/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: "Test_Project_Native_ios")
        
        container.loadPersistentStores { (storeDescriptore, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            // print error
            print(error.localizedDescription)
        }
    }
}
