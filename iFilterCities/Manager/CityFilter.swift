//
//  CityFilter.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation
import SwiftUI
import MapKit

func CityFilter(cities: [City], capitals: [City], citiesPerCountry: Int, totalCities: Int, distanceThreashould: Double) -> [City] {
    var container = capitals
    var total = 0
    for newCity in cities {
        let thisCountry = newCity.country
        var counter = 0
        var rangeCheck = true
        var isCapital = false
        for existingCity in container {
            if (existingCity.country == thisCountry) {
                counter += 1
            }
        }
        if counter < citiesPerCountry && total < totalCities {
            for existingcity in container {
                let distance = getDistance(city1: newCity, city2: existingcity)
                if distance < distanceThreashould && newCity.country == existingcity.country {
                    rangeCheck = false
                }
                if existingcity.city == newCity.city {
                    isCapital = true
                }
            }
            if rangeCheck == true && isCapital == false {
                container.append(newCity)
                total += 1
                
            }
            
            
        }
    }

    return container
}


// For each city, count the existing array to see if the country where the city is in has appeared more than 10 times. If it has, ignore this city, if it hasn't, add this city to the array.
