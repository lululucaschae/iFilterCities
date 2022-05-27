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
    @State private var citiesPerCountry = 3
    @State private var totalCities = 100
    @State private var distanceThreashould = 100
    let cities: [City] = Bundle.main.decode("cities.json")
    let capitals: [City] = Bundle.main.decode("capitals.json")

    var body: some View {
        let filteredCities = CityFilter(cities: cities, capitals: capitals, citiesPerCountry: citiesPerCountry, totalCities: totalCities, distanceThreashould: Double(distanceThreashould))
        let data = Bundle.main.encode(file: filteredCities)
        let url = getDocumentsDirectory().appendingPathComponent("sample.json")
        

        NavigationView {
            VStack {
                Form {
                    Stepper("\(citiesPerCountry) cities per country", value: $citiesPerCountry, in: 1...10)
                    Picker("Number of cities", selection: $totalCities) {
                        ForEach(50...500, id: \.self) {number in
                            Text("\(number)")
                        }
                    }

                }
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
                }
                HStack {
                    Spacer()
                    NavigationLink("View in map") {
                        MapView(cities: filteredCities)
                    }
                    Spacer()
                    Button("Save database") {
                        do {
                            try data.write(to: url)
                            self.isExportingDocument = true
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    .background(DocumentInteractionController($isExportingDocument,
                                                          url: url))
                    Spacer()

                }
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


