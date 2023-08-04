import SwiftUI

extension RecipeDetailsHeaderView {
    struct ViewModel {
        let title: String
        let duration: Int
        let reviews: Int
        let onBookmark: () -> Void

        var readableDuration: String {
            "\(duration) min"
        }
        var readableReviews: String {
            "(\(reviews)k Reviews)"
        }
    }
}

struct RecipeDetailsHeaderView: View {
    let viewModel: ViewModel
    var body: some View {
        VStack(spacing: 10.0) {
            ZStack {

                Image("placeholder-recipe-image")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150.0)

               LinearGradient(colors: [
                                 .clear,
                                 .black
                             ],
                              startPoint: .top,
                              endPoint: .bottom)

                VStack(alignment: .trailing, spacing: 10) {
                    Spacer()
                    HStack {
                            Image("star")
                                .frame(width: 8, height: 8)

                            Text("4.0")
                                .font(Font.custom("Poppins", size: 8))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)

                    }

                         .padding(.horizontal, 10)
                         .padding(.vertical, 3)
                        .background(Color(red: 1, green: 0.88, blue: 0.7))
                        .cornerRadius(20)
                        .padding()
                    Spacer(minLength: 15)

                    HStack {
                        Spacer()

                        HStack {
                            Image("icon-timer")
                                .frame(width: 17, height: 17)

                            Text(viewModel.readableDuration)
                                .foregroundColor(.white)

                            Button(action: viewModel.onBookmark) {
                                Image(systemName: "bookmark")
                            }
                            .padding(4.0)
                            .background(Color.white)
                            .cornerRadius(.infinity)
                        }
                        .padding()
                    }
                }
            }
            .frame(height: 150.0)
            .clipped()
            .cornerRadius(10.0)

            HStack(alignment: .top) {
                Text(viewModel.title)
                    .bodyTextStyle()

                Spacer()

                Text(viewModel.readableReviews)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct RecipeDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
     RecipeDetailsHeaderView(
        viewModel: RecipeDetailsHeaderView.ViewModel(
            title: "Spicy chicken burger with French fries",
            duration: 20,
            reviews: 13, onBookmark: {
                print("Did tap bookmark")
            }
        )
     )
    }
}
