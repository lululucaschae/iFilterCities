//
//  UrlGenerator.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/30/22.
//

import Foundation

func UrlGenerator(cities: [City]) -> [String] {
    
    var container = [String]()
    
    for city in cities {
        container.append(city.hourlyUrl ?? "Url not found")
    }
    
    
    return container
}
