import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var notes: [Note] = []
    @State private var text = ""

    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                Button(action: {
                    guard !text.isEmpty else { return }
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                })
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)
            } //: HSTACK
            Spacer()
            Text("\(notes.count)")
        } //: VSTACK
        .navigationTitle("Notes")
    }

    // MARK: - HELPERS

    private func save() {
        dump(notes)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
