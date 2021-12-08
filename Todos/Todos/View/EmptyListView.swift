import SwiftUI

struct EmptyListView: View {
    // MARK: - PROPERTIES

    @State private var isAnimating = false

    let images = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]

    let tips = [
        "Use your time wisely.",
        "Slow and stedy wins the race.",
        "Keep it short and sweet.",
        "Put hard tasks first.",
        "Reward yourself after work.",
        "Collect tasks ahead of time.",
        "Each night schedule for tomorrow."
    ]

    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image(images.randomElement() ?? images[0])
                    .resizable()
                    .scaledToFit()
                    .frame(
                        minWidth: 256,
                        idealWidth: 280,
                        maxWidth: 360,
                        minHeight: 256,
                        idealHeight: 280,
                        maxHeight: 360,
                        alignment: .center
                    )
                    .layoutPriority(1)
                Text(tips.randomElement() ?? tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))

            } //: VSTACK
            .padding(.horizontal)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -50)
            .animation(.easeOut(duration: 1.5), value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
        } //: ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(baseColor)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .dark)
            
    }
}
