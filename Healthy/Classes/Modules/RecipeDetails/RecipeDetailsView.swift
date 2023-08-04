import SwiftUI
import UIKit

final class RecipeDetailsHostingController: UIHostingController<RecipeDetailsView> {
    init() {
        let viewModel = RecipeDetailsViewModel()
        let view = RecipeDetailsView(viewModel: viewModel)
        super.init(rootView: view)
    }

     @available(*, unavailable)
     required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct RecipeDetailsView: View {
    @ObservedObject var viewModel: RecipeDetailsViewModel

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                RecipeDetailsHeaderView(viewModel: viewModel.headerViewModel)
                RecipeDetailsChefView(viewModel: viewModel.chefViewModel)
            }
            .padding()
        }

    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(viewModel: RecipeDetailsViewModel())
    }
}
