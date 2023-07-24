import Foundation
import UIKit

// MARK: DashboardViewModel

class DashboardViewModel {}

// MARK: DashboardViewModel

extension DashboardViewModel: DashboardViewModelInput {}

// MARK: DashboardViewModelOutput

extension DashboardViewModel: DashboardViewModelOutput {

    var header: HomeHeaderView.ViewModel {
        .init(title: "Name", subtitle: "subtitle", imageUrl: URL(string: "www.google.com"))
    }

    var foodTags: FoodTagsView.ViewModel {
        .init(foodCategories: [.init(foodCategoryName: "category1"),
                               .init(foodCategoryName: "category2"),
                               .init(foodCategoryName: "category3")],
              selected: .init(foodCategoryName: "category1")) { model in
            print(model)
        }
    }

    var dishes: SliderDishesView.ViewModel {
        .init(dishes: [
            .init(imageUrl: UIImage.previewDishes1,
                  dishName: "Crunchy Nut",
                  time: "", duration: "\(13) Mins", rating: 4.3),
            .init(imageUrl: UIImage.previewDishes2,
                  dishName: "Crunchy Nut Coleslaw",
                  time: "6:00", duration: "\(15) Mins", rating: 4.3 ),
            .init(imageUrl: nil,
                  dishName: "Test",
                  time: "", duration: "\(13) Mins", rating: 4.3),
            .init(imageUrl: nil,
                  dishName: "Tes",
                  time: "", duration: "\(15) Mins", rating: 4.3)
        ]) { model in
            print(model)
        }
    }

    var newRecipes: NewRecipesView.ViewModel {
        .init(newRecipes: [
            .init(recipeName: "Steak with tomato sauce and bulgur rice.",
                  userName: "By James Milner",
                  preparationTimeInMinutes: "20 mins",
                  recipeImageUrl: "google.com",
                  rating: 4,
                  userImageUrl: "google.com"),
            .init(recipeName: "Pilaf sweet with lamb-and-raisins",
                  userName: "By Laura wilson",
                  preparationTimeInMinutes: "20 mins",
                  recipeImageUrl: "google.com",
                  rating: 3,
                  userImageUrl: "google.com"),
            .init(recipeName: "Rice Pilaf, Broccoli and Chicken",
                  userName: "By Lucas Moura",
                  preparationTimeInMinutes: "10 mins",
                  recipeImageUrl: "google.com",
                  rating: 2,
                  userImageUrl: "google.com")
        ]) { model in
            print(model)
        }
    }

}

// MARK: Private Handlers

private extension DashboardViewModel {}
