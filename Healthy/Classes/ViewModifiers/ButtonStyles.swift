import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            Text("Follow")
                .font(Font(UIFont.mediumBold))
                .foregroundColor(.white)
                .padding()
                .background(Color(.primary100))
               .cornerRadius(10.0)
    }
}

 struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me!", action: {})
            .buttonStyle(PrimaryButtonStyle())
    }
 }
