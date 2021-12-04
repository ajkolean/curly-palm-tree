import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif).weight(.bold))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct TitleModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Title Text")
            .titleStyle()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}
