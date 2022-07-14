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
    @State private var citiesPerCountry = 30
    @State private var totalCities = 3000
    @State private var distanceThreashould = 30
    let cities: [City] = Bundle.main.decode("cities.json")
    let capitals: [City] = Bundle.main.decode("capitals.json")
    let stations: [Station] = Bundle.main.decode("stations.json")


    var body: some View {
        let filteredCities = CityFilter(cities: cities, capitals: capitals, citiesPerCountry: citiesPerCountry, totalCities: totalCities, distanceThreashould: Double(distanceThreashould))

        
        let citiesWithStaions = StationFilter(cities: filteredCities, stations: stations)

        let data = Bundle.main.encode(file: citiesWithStaions)

        let url = getDocumentsDirectory().appendingPathComponent("sample.json")
        

        

        NavigationView {
            VStack {
                Form {
                    Stepper("\(citiesPerCountry) cities per country", value: $citiesPerCountry, in: 1...20)
                    Picker("Number of cities", selection: $totalCities) {
                        ForEach(50...3000, id: \.self) {number in
                            Text("\(number)")
                        }
                    }

                }
                List {
                    ForEach(citiesWithStaions.indices, id: \.self) { i in
                        HStack {
                            Text("\(i+1).")
                            Text("\(citiesWithStaions[i].city ?? "N/A"),")
                            Text(citiesWithStaions[i].country ?? "N/A")
                            Spacer()
                            Text(String(citiesWithStaions[i].population ?? 0))
                            Text(citiesWithStaions[i].station ?? "N/A")
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


