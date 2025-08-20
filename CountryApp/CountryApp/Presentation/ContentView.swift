//
//  ContentView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel: CountryListViewModel
    
    init(viewModel: CountryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var filteredCountries: [Country] = [Country(id: "1", cca2: "EG", name: Country.Name(common: "Egypt", official: "Arab Republic of Egypt"), flags: Country.Flag(png: "https://flagcdn.com/eg.png", svg: nil, alt: nil), coatOfArms: nil, region: "Africa", subregion: "Northern Africa", capital: ["Cairo"], area: 1002450, population: 102334404, languages: ["ar": "Arabic"], car: Country.Car(signs: ["E"], side: "right"), currencies: ["EGP": Country.Currency(name: "Egyptian pound", symbol: "£")], timezones: ["UTC+02:00"]), Country(id: "2", cca2: "US", name: Country.Name(common: "United States", official: "United States of America"), flags: Country.Flag(png: "https://flagcdn.com/us.png", svg: nil, alt: nil), coatOfArms: nil, region: "Americas", subregion: "Northern America", capital: ["Washington, D.C."], area: 9833517, population: 331002651, languages: ["en": "English"], car: Country.Car(signs: ["USA"], side: "right"), currencies: ["USD": Country.Currency(name: "United States dollar", symbol: "$")], timezones: ["UTC-05:00", "UTC-06:00", "UTC-07:00", "UTC-08:00"])]
   
    @State private var username: String = ""
    @State var addedCountries: [Country] = []
    
    var body: some View {
        NavigationStack {
            VStack {
               
                List(filteredCountries) { country in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 24))
                        Text(country.name.common)
                        Spacer()
        
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxHeight: 200)
                

            }
            .navigationTitle("Countrys")
        }
       
        .task {
            await viewModel.getAllCountries()
        }
    }
}
