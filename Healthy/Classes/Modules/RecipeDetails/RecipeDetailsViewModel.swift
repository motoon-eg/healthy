import Foundation

final class RecipeDetailsViewModel: ObservableObject {
    var headerViewModel: RecipeDetailsHeaderView.ViewModel {
        RecipeDetailsHeaderView.ViewModel(
                title: "Spicy chicken burger with French fries",
                duration: 20,
                reviews: 13, onBookmark: {
                    print("Did tap bookmark")
                }
            )
    }

    var chefViewModel: RecipeDetailsChefView.ViewModel {
        RecipeDetailsChefView.ViewModel(chefName: "Laura wilson", location: "Lagos, Nigeria")
    }

    var selectionViewModel: RecipeDetailsSelectionView.ViewModel {
        RecipeDetailsSelectionView.ViewModel(
            ingredient: "Ingredient",
            procedure: "Procedure")
    }

    var ingredientViewModel: [IngredientListView.ViewModel] {
             [IngredientListView.ViewModel(
              ingredientName: "Tomatos",
              ingredientImage: "placeholder-tomatos-image",
              ingredientQuantity: "500"),
              IngredientListView.ViewModel(
                ingredientName: "Cabbage",
                ingredientImage: "placeholder-cabbage-image",
                ingredientQuantity: "300"),
              IngredientListView.ViewModel(
                ingredientName: "Taco",
                ingredientImage: "placeholder-taco-image",
                ingredientQuantity: "300"),
              IngredientListView.ViewModel(
                ingredientName: "Slice Bread",
                ingredientImage: "placeholder-slice-image",
                ingredientQuantity: "300")
        ]
    }
    var recipesTitleViewModel: RecipeDetailsTitleView.ViewModel {
        RecipeDetailsTitleView.ViewModel(dishImage: "icon-dish",
                                         serveCount: 1,
                                         itemsCount: 10)
    }
}
