//
//  Station.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/30/22.
//

import Foundation

struct Station: Codable {
    let id: String
    let name: Name
//    let inventory: Inventory?
    
    struct Name: Codable {
        let en: String
    }
    
//    struct Inventory: Codable {
//        let daily: String?
//        let monthly: String?
//    }
    
}




