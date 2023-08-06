import SwiftUI

extension IngredientListView {
    struct ViewModel {
        let ingredientName: String
        let ingredientImage: String
        let ingredientQuantity: String
    }
}

extension IngredientListView.ViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
        hasher.combine(ingredientImage)
        hasher.combine(ingredientQuantity)
    }
}

struct IngredientListView: View {
    let items: [ViewModel]
    
    var body: some View {
        ForEach(items, id: \.self) { item in
            HStack {
                Image(item.ingredientImage)
                    .resizable()
                    .frame(width: 52.0, height: 52.0)
                
                Text(item.ingredientName)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("\(item.ingredientQuantity) gm")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.black20))
            .cornerRadius(12.0)
        }
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView(
            items: [IngredientListView.ViewModel(
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
            ])
    }
}
