import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // PIN STYLE
            // MapPin(coordinate: item.location, tint: .accentColor)

            // MARKERS
            // MapMarker(coordinate: item.location, tint: .accentColor)

            // CUSTOM
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: ANNOTATION
        }
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
