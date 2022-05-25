//
//  CityLocation.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/25/22.
//

import Foundation
import MapKit

//    City format
//    "city": "Tokyo",
//    "city_ascii": "Tokyo",
//    "lat": 35.6839,
//    "lng": 139.7744,
//    "country": "Japan",
//    "iso3": "JPN",
//    "population": 39105000

//    Location format
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D

//    Coordinate format
//    coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141))

func CityLocation(cities: [City]) -> [Location] {
    
    var locationContainer = [Location]()
    
    for city in cities {
        let thisLocation = Location(name: city.city ?? "N/A", coordinate: CLLocationCoordinate2D(latitude: city.lat ?? 0, longitude: city.lng ?? 0))
        locationContainer.append(thisLocation)
    }
    
    return locationContainer
}
