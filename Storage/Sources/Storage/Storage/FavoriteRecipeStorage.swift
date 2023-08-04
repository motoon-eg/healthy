import Domain

public protocol FavoriteRecipeStorage {
    func favoriteRecipe(_ recipe: Recipe)
    func unfavoriteRecipe(_ recipe: Recipe)
    func isFavoriteRecipe(_ recipe: Recipe) -> Bool
    func fetchFavoriteRecipes() -> [Recipe]
}

public final class DefaultFavoriteRecipeStorage: FavoriteRecipeStorage {
    private let coreDataWrapper: CoreDataWrapping

    public init(coreDataWrapper: CoreDataWrapping) {
        self.coreDataWrapper = coreDataWrapper
    }

    public func favoriteRecipe(_ recipe: Recipe) {
        let object = coreDataWrapper.createObject(ofType: FavoriteRecipeEntity.self)
        object.recipeId = recipe.recipeId
        object.title = recipe.title
        object.imageUrl = recipe.recipeImageUrl
        object.rating = Int64(recipe.rating ?? .zero)
        object.userImageUrl = recipe.userImageUrl
        object.userName = recipe.userName
        object.preparationTime = Int64(recipe.preparationTime ?? .zero)
        coreDataWrapper.saveContext()
    }

    public func unfavoriteRecipe(_ recipe: Recipe) {
        let predicate = \FavoriteRecipeEntity.recipeId == recipe.recipeId
        let object = coreDataWrapper.firstObject(
            ofType: FavoriteRecipeEntity.self,
            matching: predicate
        )

        guard let object else {
            return
        }

        coreDataWrapper.deleteObject(object)
    }

    public func isFavoriteRecipe(_ recipe: Recipe) -> Bool {
        let predicate = \FavoriteRecipeEntity.recipeId == recipe.recipeId
        let object = coreDataWrapper.firstObject(
            ofType: FavoriteRecipeEntity.self,
            matching: predicate
        )

        return object != nil
    }

    public func fetchFavoriteRecipes() -> [Recipe] {
        let objects = coreDataWrapper.fetchObjects(ofType: FavoriteRecipeEntity.self)
        return objects.map {
            Recipe(recipeId: $0.recipeId,
                   title: $0.title ?? String(),
                   recipeImageUrl: $0.imageUrl ?? String(),
                   rating: Int($0.rating),
                   userImageUrl: $0.userImageUrl ?? String(),
                   userName: $0.userName ?? String(),
                   preparationTime: Int($0.preparationTime)
            )
        }
    }
}
