import SwiftUI

extension RecipeDetailsChefView {
    struct ViewModel {
        let chefName: String
        let location: String
    }
}

struct RecipeDetailsChefView: View {
    let viewModel: ViewModel
    var body: some View {
        HStack {
            Image("image-chef-placeholder")
                .resizable()
                .frame(width: 40.0, height: 40.0)

            VStack(alignment: .leading, spacing: 2.0) {
                Text(viewModel.chefName)
                    .bodyTextStyle()
                HStack(spacing: 4.0) {
                    Image("image-location")
                    Text(viewModel.location)
                }
            }

            Spacer()

            Button("Follow", action: {})
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct RecipeDetailsChefView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsChefView(
            viewModel: RecipeDetailsChefView.ViewModel(
                chefName: "Laura wilson",
                location: "Lagos, Nigeria"))
    }
}
