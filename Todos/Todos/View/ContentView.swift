import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default
    )
    private var todos: FetchedResults<Todo>

    @State private var isShowingAddView = false

    // MARK: - PREVIEW
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Text(todo.name ?? "Unknown")
                            Spacer()
                            Text(todo.priority ?? "Unknown")
                        }
                    } //: LOOP
                    .onDelete(perform: deleteItems)
                } //: LIST
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
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

                // MARK: - EMPTY TODOS

                if todos.isEmpty {
                    EmptyListView()
                }
            } //: ZSTACK
        } //: NAVIGATION
    }

    // MARK: - HELPERS

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
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
