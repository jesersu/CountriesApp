//
//  ContentView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//

import SwiftUI

struct CountryView: View {

    @StateObject private var viewModel: CountryListViewModel
    @State private var username: String = ""
    @State var addedCountries: [Country] = []

    @State private var searchText: String = ""
    
    init(viewModel: CountryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchView(searchText: $searchText) { query in
                   Task {
                       await viewModel.getCountryByName(name: query)
                   }
               }
                
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(error: error) {
                        Task { await viewModel.getAllCountries() }
                    }
                } else {
                    List(viewModel.filteredCountries) { country in
                        Button {
                           Task {
                               await viewModel.getCountryById(id: country.id)
                           }
                        } label: {
                            CountryRow(country: country, viewModel: viewModel)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                }
            }
            .navigationTitle("Countries")
            .navigationDestination(item: $viewModel.fetchedCountry) { countryNew in
                CountryDetailView(country: countryNew)
            }
        }
       
        .task {
            await viewModel.getAllCountries()
        }
        .overlay {
             if viewModel.isFetchingCountry {
                 LoadingView()
             }
         }
    }
}
