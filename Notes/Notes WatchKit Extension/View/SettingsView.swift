import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES

    @AppStorage("lineCount") private var lineCount = 1
    @State private var value: Float = 1.0

    var sliderBinding: Binding<Float> {
        Binding(
            get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }
        )
    }

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")

            // ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)

            // SLIDER
            Slider(value: sliderBinding, in: 1...4, step: 1)
                .foregroundColor(.accentColor)
        } //: VSTACK
    }

    // MARK: - HELPERS
    private func update() {
        lineCount = Int(value)
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
