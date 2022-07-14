//
//  StationFilter.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/30/22.
//

import Foundation
import CoreLocation

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
        var stationWiththisCityName = [Station]()
        var mostEffectiveStation: Station
        for station in stations {
            // Loop through station list for Tokyo
//            if city.city == station.name.en {

            if station.name.en.localizedCaseInsensitiveContains(city.city!) && station.inventory.daily.start != nil && station.inventory.daily.end != nil {
                let cityCoordinates = CLLocation(latitude: city.lat ?? 0, longitude: city.lng ?? 0)
                let stationCoordinates = CLLocation(latitude: station.location.latitude, longitude: station.location.longitude)
                let distance = Double(cityCoordinates.distance(from: stationCoordinates))
                
                print("city CO: \(cityCoordinates)")
                print("station CO: \(stationCoordinates)")
                print("distance is: \(distance)")
                print("city before distance filter: \(city.city)")
                
                if(distance < 50000) {
                    stationWiththisCityName.append(station)
                    foundStation = true
                    print(city.city)
                    print(city.country)
                }
                


//                city.station = station.id
//                finalOutput.append(city)
//                foundStation = true
//                city.hourlyUrl = "https://bulk.meteostat.net/v2/daily/\(city.station ?? "000000").csv.gz"
//                print(city.hourlyUrl!)
//                print(city.city)
//                print(city.country)
//                break
            }
        }
        if foundStation == true {
            var stationWithMostRecord: Station?
            var finalStationYear: Int = -1
            for station in stationWiththisCityName {
                let startYear = Int(station.inventory.daily.start!.prefix(4))!
                print("Start year: \(startYear)")
                let endYear = Int(station.inventory.daily.end!.prefix(4))!
                print("End year: \(endYear)")
                let thisStationYear = endYear-startYear
                
                if thisStationYear > finalStationYear {
                    finalStationYear = thisStationYear
                    stationWithMostRecord = station
                }
            }
            print(stationWithMostRecord)
            city.station = stationWithMostRecord!.id
            finalOutput.append(city)
        
            
        }
        
        
        if foundStation == false {
            city.station = "Station not found"
            finalOutput.append(city)
        }
    }

    
    return finalOutput
}
