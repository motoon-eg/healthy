import SwiftUI

extension RecipeDetailsSelectionView {
    struct ViewModel {
        let ingredient: String
        let procedure: String
    }
}

struct RecipeDetailsSelectionView: View {
    let viewModel: ViewModel
    
    @State private var isIngredientSelected = true
    var body: some View {
        HStack(alignment: .top, spacing: 15.0) {
            
            Button("Ingredient", action: {
                isIngredientSelected = true
            }).background(isIngredientSelected ? Color(.primary100) : Color(.primary20))
                .buttonStyle(SecondaryButtonStyle())
                .cornerRadius(10.0)
            
            Button("Procedure", action: {
                isIngredientSelected = true
            }).background(!isIngredientSelected ? Color(.primary100): Color(.primary20))
                .buttonStyle(SecondaryButtonStyletwo())
                .cornerRadius(10.0)
            
        }.padding(.horizontal, 30)
            .padding(.top, 12)
            .padding(.bottom, 13)
            .frame(width: 375.0)
        
    }
}

struct RecipeDetailsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsSelectionView(
            viewModel: RecipeDetailsSelectionView.ViewModel(
                ingredient: "Ingredient",
                procedure: "Procedure"))
    }
}
