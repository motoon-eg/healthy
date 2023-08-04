import CoreData

@objc(FavoriteRecipeEntity)
final class FavoriteRecipeEntity: NSManagedObject, Object {
    public static func fetchRequest() -> NSFetchRequest<FavoriteRecipeEntity> {
        return NSFetchRequest(entityName: "FavoriteRecipeEntity")
    }

    @NSManaged var recipeId: String
    @NSManaged var title: String?
    @NSManaged var imageUrl: String?
    @NSManaged var rating: Int64
    @NSManaged var userImageUrl: String?
    @NSManaged var userName: String?
    @NSManaged var preparationTime: Int64
}
