import SwiftUI

private struct BodyTextViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.mediumBold))
            .foregroundColor(.black)
    }
}

extension View {
    func bodyTextStyle() -> some View {
        self.modifier(BodyTextViewModifier())
    }
}
