import SwiftUI
import CoreData

struct AddTodoView: View {
    // MARK: - PROPERTIES

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode

    @State private var name = ""
    @State private var priority = "Normal"

    @State private var isErrorShowing = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""

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
                        saveTodo()
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
            .alert(isPresented: $isErrorShowing) {
                Alert(
                    title: Text(errorTitle),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        } //: NAV
    }

    // MARK: - HELPERS

    private func saveTodo() {
        guard !name.isEmpty else {
            isErrorShowing = true
            errorTitle = "Invalid Name"
            errorMessage = "Make sure to enter something for the todo item."
            return
        }
        let todo = Todo(context: viewContext)
        todo.name = name
        todo.priority = priority
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
