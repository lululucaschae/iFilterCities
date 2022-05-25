//
//  CityFilter.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation
import SwiftUI

func CityFilter(cities: [City], citiesPerCountry: Int, totalCities: Int) -> [City] {
    
    var container = [City]()
    var total = 0
    for city in cities {
        let thisCountry = city.country
        var counter = 0
        for city in container {
            if (city.country == thisCountry) {
                counter += 1
            }
        }
        if counter < citiesPerCountry && total < totalCities {
            container.append(city)
            total += 1
        }
    }

    return container
}


// For each city, count the existing array to see if the country where the city is in has appeared more than 10 times. If it has, ignore this city, if it hasn't, add this city to the array.
