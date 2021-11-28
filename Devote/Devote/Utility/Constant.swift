import SwiftUI

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

var backgroundGradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(colors: [.pink, .blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

// MARK: - UX
