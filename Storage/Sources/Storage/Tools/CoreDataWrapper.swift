import CoreData

public protocol Object: NSManagedObject {
    static func fetchRequest() -> NSFetchRequest<Self>
}

public protocol CoreDataWrapping {
    func saveContext()
    func createObject<T: Object>(ofType type: T.Type) -> T
    func fetchObjects<T: Object>(ofType type: T.Type,
                                 predicate: NSPredicate?,
                                 sortDescriptors: [NSSortDescriptor]?) -> [T]
    func firstObject<T: Object>(ofType type: T.Type,
                                matching predicate: NSPredicate?) -> T?
    func deleteObject<T: Object>(_ object: T)
}

public extension CoreDataWrapping {
    func fetchObjects<T: Object>(ofType type: T.Type,
                                 predicate: NSPredicate? = nil,
                                 sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        fetchObjects(ofType: type,
                     predicate: predicate,
                     sortDescriptors: sortDescriptors)
    }

    func firstObject<T: Object>(ofType type: T.Type,
                                matching predicate: NSPredicate? = nil
    ) -> T? {
        firstObject(ofType: type, matching: predicate)
    }
}

public final class CoreDataWrapper: CoreDataWrapping {
    private let persistentContainer: NSPersistentContainer

    public init(modelName: String) {
        guard let modelURL = Bundle.module.url(forResource: modelName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to create model with name: \(modelName) in module bundle")
        }

        persistentContainer = NSPersistentContainer(name: modelName, managedObjectModel: model)
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    public func createObject<T: Object>(ofType type: T.Type) -> T {
        return T(context: persistentContainer.viewContext)
    }

    public func fetchObjects<T: Object>(ofType type: T.Type,
                                        predicate: NSPredicate? = nil,
                                        sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors

        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }

    public func firstObject<T: Object>(ofType type: T.Type,
                                       matching predicate: NSPredicate? = nil) -> T? {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.fetchLimit = 1

        do {
            return try persistentContainer.viewContext.fetch(fetchRequest).first
        } catch {
            print("Fetch error: \(error)")
            return nil
        }
    }

    public func deleteObject<T: Object>(_ object: T) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
}
