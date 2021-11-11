import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .frame(width: 256, height: 256, alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            , value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }

                } //: LOOP
            } //: ZSTACK
            // composites image offscreen before display with Metal
            .drawingGroup()
        } //: GEOMETRY
    }

    // MARK: - Helpers
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        .random(in: 0...max)
    }

    private func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }

    private func randomScale() -> CGFloat {
        .random(in: 0.1...2.0)
    }

    private func randomSpeed() -> Double {
        .random(in: 0.025...1.0)
    }

    private func randomDelay() -> Double {
        .random(in: 0...2)
    }
}

// MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
