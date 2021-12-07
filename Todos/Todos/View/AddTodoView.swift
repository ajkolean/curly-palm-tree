import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES

    @Environment(\.presentationMode) private var presentationMode

    @State private var name = ""
    @State private var priority = "Normal"

    let priorities = ["High", "Normal", "Low"]

    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)

                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        } //: LOOP
                    } //: PICKER
                    .pickerStyle(.segmented)

                    // MARK: - SAVE BUTTON

                    Button(action: {
                        print("save")
                    }, label: {
                        Text("Save")
                    }) //: BUTTON
                } //: FORM
                Spacer()
            } //: VSTACK
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAV
    }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
