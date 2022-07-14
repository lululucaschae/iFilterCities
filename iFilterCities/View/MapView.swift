//
//  MapView.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/25/22.
//

import SwiftUI
import MapKit



struct MapView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    let cities: [City]
    let newLocation = [Location]()
    
    var body: some View {
        let locations = CityLocation(cities: cities)
        
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .background(Circle().foregroundColor(Color.red))
                        .opacity(0.1)
                        .frame(width: 12, height: 12)
                }
            }
            .navigationTitle("Map")
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(cities: [City]())
    }
}
