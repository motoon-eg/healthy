import SwiftUI

extension RecipeDetailsTitleView {
    struct ViewModel {
        let dishImage: String
        let serveCount: Int
        let itemsCount: Int
    }
}

struct RecipeDetailsTitleView: View {
    let viewModel: ViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.dishImage)
                .frame(width: 17.0, height: 17.0)
            
            Text("\(viewModel.serveCount) serve")
                .titleTextStyle()
            
            Spacer()
            
            Text("\(viewModel.itemsCount) Items")
                .titleTextStyle()
            
        }.padding()
    }
}

struct RecipeDetailsTitleView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsTitleView(viewModel: RecipeDetailsTitleView.ViewModel(
            dishImage: "icon-dish",
            serveCount: 1,
            itemsCount: 10))
    }
}
