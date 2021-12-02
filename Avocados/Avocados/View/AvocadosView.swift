import SwiftUI

struct AvocadosView: View {
    // MARK: - PROPERTIES

    @State private var pulsateAnimation = false

    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(pulsateAnimation ? 1 : 0.9)
                .opacity(pulsateAnimation ? 1 : 0.9)
                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
                Text("""
                     Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
                     """)
                    .lineLimit(nil)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(Color("ColorGreenLight"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .frame(maxWidth: 640, minHeight: 120)
            } //: VSTACK
            .padding()
            Spacer()
        } //: VSTACK
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            pulsateAnimation.toggle()
        }
    }
}

// MARK: - PREVIEW
struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .environment(\.colorScheme, .dark)
    }
}
