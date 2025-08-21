//
//  ContentView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel: CountryListViewModel
    @State private var username: String = ""
    @State var addedCountries: [Country] = []
    @State private var selectedCountryID: String?
    
    init(viewModel: CountryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(error: error) {
                        Task { await viewModel.getAllCountries() }
                    }
                } else {
                    List(viewModel.allCountries) { country in
                 
                        Button {
                           Task {
                               await viewModel.getCountryById(id: country.id)
                           }
                        } label: {
                            HStack {
                                
                                if let flagURL = country.flags?.png, let url = URL(string: flagURL), UIApplication.shared.canOpenURL(url) {
                                    AsyncImage(url: url) { image in
                                        image.resizable().scaledToFit()
                                    } placeholder: {
                                        Color.gray.opacity(0.2)
                                    }
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(10)
                                }
                 
                                VStack (alignment: .leading){
                                    Text(country.name.common)
                                    Text(country.name.official)
                                        .font(.system(size: 12))
                                    Text(country.capital?.first ?? "No Capital")
                                        .font(.system(size: 10))
                                }
                                Spacer()
                            }
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
