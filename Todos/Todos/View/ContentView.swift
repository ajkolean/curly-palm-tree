import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.id, ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<Todo>

    @State private var isShowingAddView = false

    // MARK: - PREVIEW
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text(item.name ?? "")
                } //: LIST
                .onDelete(perform: deleteItems)
            }
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }

                    Button(action: {
                        isShowingAddView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                        .sheet(isPresented: $isShowingAddView) {
                            AddTodoView()
                        }
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
