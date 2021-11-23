import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top)

            // HEADER
            HeaderDetailView()
                .padding(.horizontal)

            // DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)

            // DETAIL BOTTOM PART
            // RATINGS + SIZES
            // DESCRIPTION
            // QUANTITY + FAVORITE

            // ADD TO CART
            Spacer()
        } //: VSTACK
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: sampleProduct.red,
                green: sampleProduct.green,
                blue: sampleProduct.blue
            ).ignoresSafeArea(.all, edges: .all)
        )
    }
}

// MARK: - PREVIEW
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
