//
//  ContentView.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import SwiftUI

struct MainView: View {
    @State private var isExportingDocument = false
    @State private var counter = 0
    let cities: [City] = Bundle.main.decode("cities.json")

    var body: some View {
        let filteredCities = CityFilter(cities: cities)
        let data = Bundle.main.encode(file: filteredCities)
        let url = getDocumentsDirectory().appendingPathComponent("sample.json")
        

        NavigationView {
            VStack {
                List {
                    ForEach(filteredCities.indices, id: \.self) { i in
                        HStack {
                            Text("\(i+1).")
                            Text("\(filteredCities[i].city ?? "N/A"),")
                            Text(filteredCities[i].country ?? "N/A")
                            Spacer()
                            Text(String(filteredCities[i].population ?? 0))
                        }
                    }
                    
//                    ForEach(filteredCities, id: \.self) { city in
//                        HStack {
//                            Text("\(city.city ?? "N/A"),")
//                            Text(city.country ?? "N/A")
//                            Spacer()
//                            Text(String(city.population ?? 0))
//                        }
//                    }
                }
                Button("Save") {
                    do {
                        try data.write(to: url)
                        self.isExportingDocument = true
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .background(DocumentInteractionController($isExportingDocument,
                    url: url))
            }
            .navigationTitle("Cities")
        }
    }
}

extension Int {
    mutating func countForLine() {
        self += 1
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


