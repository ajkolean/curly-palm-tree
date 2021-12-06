import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTIES

    @Binding var showBookingAlert: Bool

    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))

            Spacer()

            Button(action: {
                showBookingAlert.toggle()
            }, label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background {
                        Capsule().stroke(.pink, lineWidth: 2)
                    }
            }) //: BUTTON

            Spacer()

            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))

        } //: HSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct FooterView_Previews: PreviewProvider {
    @State static var showAlert = false

    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
