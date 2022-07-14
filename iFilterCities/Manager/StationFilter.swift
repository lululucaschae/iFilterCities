//
//  StationFilter.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/30/22.
//

import Foundation

func StationFilter(cities: [City], stations: [Station]) -> [City] {

    
    var finalOutput = [City]()
    
//    for var city in cityContainer {
//        for station in stationContainer {
//            print(city.city)
//            print("\(station.id)")
//            print(station.name.en)
//            print("Before adjustment : \(city.station)")
//            if city.city == station.name.en {
//                city.station = station.id
//                print("After adjustment : \(city.station)")
//                break
//            }
//
//        }
//    }
    
    for var city in cities {
        // Tokyo
        var foundStation = false
        for station in stations {
            // Loop through station list for Tokyo
//            if city.city == station.name.en {
            if station.name.en.contains(city.city!) {
                city.station = station.id
                finalOutput.append(city)
                foundStation = true
                city.hourlyUrl = "https://bulk.meteostat.net/v2/daily/\(city.station ?? "000000").csv.gz"
                print(city.hourlyUrl!)
                print(city.city)
                print(city.country)
                break
                
            }
        }
        if foundStation == false {
            city.station = "Station not found"
            finalOutput.append(city)
        }
    }

    
    return finalOutput
}
