import SwiftUI

struct ListRowItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item

    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.isCompleted) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.isCompleted ? .pink : .primary)
                .padding(.vertical, 12)
                // Does this work correctly
                .animation(.default, value: item.isCompleted)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}
