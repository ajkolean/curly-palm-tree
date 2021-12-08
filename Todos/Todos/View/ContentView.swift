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
    @State private var isShowingSettingsView = false
    @State private var isAnimatingButton = false

    // MARK: - BODY
    var body: some View {
        NavigationView {
            listView
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingSettingsView.toggle()
                        }, label: {
                            Image(systemName: "paintbrush")
                        })
                            .sheet(isPresented: $isShowingSettingsView) {
                                SettingsView()
                            }
                    }
                }
                .sheet(isPresented: $isShowingAddView) {
                    AddTodoView()
                }
                .overlay(alignment: .bottomTrailing) {
                    ZStack {
                        Group {
                            Circle()
                                .fill(.blue)
                                .opacity(isAnimatingButton ? 0.2 : 0)
                                .scaleEffect(isAnimatingButton ? 1 : 0)
                                .frame(width: 68, height: 68, alignment: .center)

                            Circle()
                                .fill(.blue)
                                .opacity(isAnimatingButton ? 0.15 : 0)
                                .scaleEffect(isAnimatingButton ? 1 : 0)
                                .frame(width: 88, height: 88, alignment: .center)
                        }
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimatingButton)

                        Button(action: {
                            isShowingAddView.toggle()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .background(Circle().fill(baseColor))
                                .frame(width: 48, height: 48, alignment: .center)
                        }) //: BUTTON
                            .onAppear {
                                isAnimatingButton.toggle()
                            }
                    } //: ZSTACK
                    .padding([.bottom, .trailing], 15)
                }
                .navigationTitle("TODO")
                .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
    }

    // MARK: - VIEWS

    @ViewBuilder
    private var listView: some View {
        if todos.isEmpty {
            EmptyListView()
        } else {
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
        }
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
