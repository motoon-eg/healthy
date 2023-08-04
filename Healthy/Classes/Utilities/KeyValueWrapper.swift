import Foundation

protocol StorageKey {
    var rawValue: String { get }
}

enum OnboardingStorageKey: String, StorageKey {
    case userDidAcknowledgeOnboarding
}

enum AuthenticationStorageKey: String, StorageKey {
    case userDidAcknowledgeOnboarding
}

protocol KeyValueWrapper {
    func setObject<T>(_ object: T, forKey key: StorageKey)
    func object<T>(forKey key: StorageKey) -> T?
    
    func setCodableObject<T: Encodable>(_ object: T, forKey key: StorageKey)
    func codableObject<T: Decodable>(forKey key: StorageKey) -> T?
}

extension UserDefaults: KeyValueWrapper {
    func setObject<T>(_ object: T, forKey key: StorageKey) {
        setValue(object, forKey: key.rawValue)
    }
    
    func object<T>(forKey key: StorageKey) -> T? {
        value(forKey: key.rawValue) as? T
    }
    
    func setCodableObject<T: Encodable>(_ object: T, forKey key: StorageKey) {
        do {
            let data = try JSONEncoder().encode(object)
            setObject(data, forKey: key)
        } catch {
            // Log the error
            print((error as NSError).debugDescription)
        }
    }

    func codableObject<T: Decodable>(forKey key: StorageKey) -> T? {
        guard let data: Data = object(forKey: key) else {
            return nil
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            // Log the error
            print((error as NSError).debugDescription)
            return nil
        }
    }
}
