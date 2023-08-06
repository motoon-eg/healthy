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

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Text("Ingredient")
            .font(Font(UIFont.smallBold))
            .foregroundColor(Color(.primary20))
            .padding()
           .frame(maxWidth: 150, maxHeight: 30, alignment: .center)
            .background(Color(.primary100))
            .cornerRadius(10.0)

    }
}

struct SecondaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me!", action: {})
            .buttonStyle(SecondaryButtonStyle())
    }
}

struct SecondaryButtonStyletwo: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Text("Procedure")
            .font(Font(UIFont.smallBold))
            .foregroundColor(Color(.primary100))
            .padding()
            .frame(maxWidth: 150, maxHeight: 30, alignment: .center)
            .background(Color(.primary20))
            .cornerRadius(10.0)

    }
}

struct SecondaryButtonStyletwo_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me!", action: {})
            .buttonStyle(SecondaryButtonStyletwo())
    }
}
