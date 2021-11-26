import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject private var shop: Shop

    // MARK: - BODY
    var body: some View {
        VStack {
            if shop.selectedProduct == nil {
                VStack(spacing: 0) {
                NavigationBarView()
                    .padding()
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .frame(minHeight: 256)
                            .padding(.vertical, 10)

                        CategoryGridView()

                        TitleView(title: "Helmets")

                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                                    .onTapGesture {
                                        feedback.impactOccurred()
                                        withAnimation(.easeOut) {
                                            shop.selectedProduct = product
                                        }
                                    }
                            } //: LOOP
                        } //: GRID
                        .padding(15)

                        TitleView(title: "Brands")

                        BrandGridView()

                        FooterView()
                            .padding(.horizontal)
                    } //: VSTACK
                } //: SCROLL
            } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
