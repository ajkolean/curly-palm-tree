import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES

    @State private var showHeadline = false
    var slideInAnimation: Animation {
        .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
        .speed(1)
        .delay(0.25)
    }

    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("avocado-slice-1")
                .resizable()
                .scaledToFill()
            HStack(alignment: .top, spacing: 6) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                VStack {
                    Text("Avocado")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)

                    Text("Avocados are a powerhouse ingredient at any meal for anyone.")
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                } //: VSTACK
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(
                    Color("ColorBlackTransparentLight")
                )
            } //: HSTACK
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadline ? 75 : 225)
            .animation(slideInAnimation, value: showHeadline)
            .onAppear {
                showHeadline.toggle()
            }
        } //: ZSTACK
        .frame(width: 480, height: 320, alignment: .center)
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
    }
}
