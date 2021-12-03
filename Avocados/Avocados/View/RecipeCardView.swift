import SwiftUI

struct RecipeCardView: View {
    // MARK: - PROPERTIES

    let recipe: Recipe

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // CARD IMAGE
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                                .padding([.trailing, .top], 16)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
                            Spacer()
                        } //: VSTACK
                    } //: HSTACK
                )

            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)

                // HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()

                // RATING
                RecipeRatingView(recipe: recipe)

                // COOKING
                RecipeCookingView(recipe: recipe)

            } //: VSTACK
            .padding()
            .padding(.bottom, 12)
        } // :VSTACK
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    }
}

// MARK: - PREVIEW
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipeData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
