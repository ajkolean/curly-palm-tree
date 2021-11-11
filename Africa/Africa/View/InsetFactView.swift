import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABS
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } // : BOX
    }
}

// MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        InsetFactView(animal: Bundle.animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
