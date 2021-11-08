import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
