//
//  ContentView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//
//how can i add a bottom navigation with two options first will the content of ContentView and other favorites, in adition add a favorites icon on the rigth of each country, if is clicked a country as favorite this will appear on the Favorites bottom navigation if no there isnt favorites show a message
import SwiftUI

struct ContentView: View {

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
                TextField("Search country...", text: $searchText)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding(.horizontal)
                   .onChange(of: searchText) {
                       Task {
                           await viewModel.getCountryByName(name: searchText)
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
