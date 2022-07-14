//
//  City.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation

struct City: Codable, Hashable {
    
//    "city": "Tokyo",
//    "city_ascii": "Tokyo",
//    "lat": 35.6839,
//    "lng": 139.7744,
//    "country": "Japan",
//    "iso3": "JPN",
//    "population": 39105000
    
    var city, city_ascii, country, iso3: String?
    var lat, lng: Double?
    var population: Int?
    var station: String?
    var hourlyUrl: String?
    
}
