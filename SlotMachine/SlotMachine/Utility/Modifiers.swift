import Foundation
import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: shadowColor, radius: 0, x: 0, y: 6)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title)
    }
}

struct ScoreLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
}

struct ScoreNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: shadowColor, radius: 0, x: 0, y: 3)
            .layoutPriority(1)
    }
}

struct ScoreContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
                Capsule()
                    .foregroundColor(shadowColor)
            )
    }
}

extension View {
    var typeErased: AnyView { AnyView(self) }

    func shadowModifier() -> some View {
        modifier(ShadowModifier())
    }

    func buttonModifier() -> some View {
        modifier(ButtonModifier())
    }

    func scoreNumberModifier() -> some View {
        modifier(ScoreNumberModifier())
    }

    func scoreContainerModifier() -> some View {
        modifier(ScoreContainerModifier())
    }
}

extension Text {
    func scoreLabelStyle() -> ModifiedContent<Text, ScoreLabelModifier> {
        modifier(ScoreLabelModifier())
    }

    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
