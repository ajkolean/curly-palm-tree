import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("theme")
    private var theme: Int = 0

    let themes = themeData

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
                .tint(themes[theme].color)

                .sheet(isPresented: $isShowingAddView) {
                    AddTodoView()
                }
                .overlay(alignment: .bottomTrailing) {
                    ZStack {
                        Group {
                            Circle()
                                .fill(themes[theme].color)
                                .opacity(isAnimatingButton ? 0.2 : 0)
                                .scaleEffect(isAnimatingButton ? 1 : 0)
                                .frame(width: 68, height: 68, alignment: .center)

                            Circle()
                                .fill(themes[theme].color)
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
        .tint(themes[theme].color)
        .navigationViewStyle(.stack)
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
                        Circle()
                            .frame(width: 12, height: 12, alignment: .center)
                            .foregroundColor(colorize(priority: todo.priority ?? "Normal"))

                        Text(todo.name ?? "Unknown")
                            .fontWeight(.semibold)

                        Spacer()

                        Text(todo.priority ?? "Unknown")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray2))
                            .padding(3)
                            .frame(minWidth: 62)
                            .overlay {
                                Capsule()
                                    .stroke(Color(uiColor: .systemGray2), lineWidth: 0.75)
                            }
                    } //: HSTACK
                    .padding(.vertical, 10)
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

    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
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