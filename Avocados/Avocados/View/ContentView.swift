import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let headers = headerData
    let facts = factData
    let recipes = recipeData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - HEADER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { header in
                            HeaderView(header: header)
                        } //: LOOP
                    } //: HSTACK
                } //: SCROLL
                
                // MARK: - DISHES
                Text("Avocado Dishes")
                    .titleStyle()
                
                DishesView()
                    .frame(maxWidth: 640)

                // MARK: - FACTS

                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { item in
                            FactsView(fact: item)
                        }
                    } //: HSTACK
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                } //: SCROLL

                // MARK: - RECIPE CARDS
                Text("Avocado Recipes")
                    .titleStyle()

                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                    } //: LOOP
                } //: VSTACK
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                // MARK: - FOOTER
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .titleStyle()
                    
                    Text("Everything you wanted to know about avocados but were to afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                } //: VSTACK
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            } //: VSTACK
        } //: SCROLL
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorSchemes()
    }
}
