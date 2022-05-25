//
//  Location.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/25/22.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
