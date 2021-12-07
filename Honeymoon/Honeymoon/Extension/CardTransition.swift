import Foundation
import SwiftUI

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        .asymmetric(
            insertion: .identity,
            removal: .move(edge: .trailing).combined(with: .move(edge: .bottom))
        )
    }

    static var leadingBottom: AnyTransition {
        .asymmetric(
            insertion: .identity,
            removal: .move(edge: .leading).combined(with: .move(edge: .bottom))
        )
    }
}
