//
//  CityFilter.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation
import SwiftUI
import MapKit

func CityFilter(cities: [City], citiesPerCountry: Int, totalCities: Int) -> [City] {
    var container = [City]()
    var total = 0
    for newCity in cities {
        let thisCountry = newCity.country
        var counter = 0
        var rangeCheck = true
        for existingCity in container {
            if (existingCity.country == thisCountry) {
                counter += 1
            }
        }
        if counter < citiesPerCountry && total < totalCities {
            for existingcity in container {
                let distance = getDistance(city1: newCity, city2: existingcity)
                if distance < 500 {
                    rangeCheck = false
                }
            }
            if rangeCheck == true {
                container.append(newCity)
                total += 1
                
            }
            
            
        }
    }

    return container
}


// For each city, count the existing array to see if the country where the city is in has appeared more than 10 times. If it has, ignore this city, if it hasn't, add this city to the array.
