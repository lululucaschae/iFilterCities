//
//  Bundle-Decodable.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation


extension Bundle {
    
    // input some file name and then return Astronaut array
    func decode<UnknownTypePlaceholder: Codable> (_ file: String) -> UnknownTypePlaceholder {
        
        // bundle.main.url OR extension Bundle{ self.url): using Bundle to find path to the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // load information of the url into an instance of data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        // Decoding "Date" format
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        // pass the data through JSON decoder
//        guard let loaded = try? decoder.decode(UnknownTypePlaceholder.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle")
//        }
//
//        return loaded
        do {
            let loaded = try decoder.decode(UnknownTypePlaceholder.self, from: data)
            return loaded
        } catch {
            fatalError("HAHA! Failed to decode \(file) from bundle. Error: \(error)")
        }
        
    }
    
    func encode(file: [City]) -> Data {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(file)
            return encoded
        } catch {
            fatalError("Failed to encode \(file) to bundle. Error: \(error)")
        }
        
    }
}
