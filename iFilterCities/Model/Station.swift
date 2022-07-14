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
    let location: StationLocation
    let inventory: Inventory
//    let inventory: Inventory?
    
    struct Name: Codable {
        let en: String
    }
    
    struct StationLocation: Codable {
        let latitude: Double
        let longitude: Double
    }
    
    struct Inventory: Codable {
        let daily: DailyRecord
    }
    
    struct DailyRecord: Codable {
        let start: String?
        let end: String?
    }
    
//    struct Inventory: Codable {
//        let daily: String?
//        let monthly: String?
//    }
    
//
//    "inventory": {
//        "model": {
//            "start": "2021-07-14",
//            "end": "2022-06-02"
//        },
//        "hourly": {
//            "start": "2020-08-10",
//            "end": "2022-05-23"
//        },
//        "daily": {
//            "start": "2020-08-11",
//            "end": "2022-05-21"
//        },
    
}




