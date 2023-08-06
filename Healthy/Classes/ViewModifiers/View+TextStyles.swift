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

private struct TitleTextViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.smallRegular))
            .foregroundColor(Color(.black20))
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.modifier(TitleTextViewModifier())
    }
}
