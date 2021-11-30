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
            if notes.count >= 1 {
                List {
                    ForEach(Array(notes.enumerated()), id: \.offset) { i, note in
                        NavigationLink(destination: DetailView(note: note, count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                            }
                        } //: HSTACK
                    } //: LOOP
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: LIST
        } //: VSTACK
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }

    // MARK: - HELPERS

    private func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Failed to save data")
        }
    }

    private func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }

    private func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }

    private func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
