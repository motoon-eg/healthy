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
}
