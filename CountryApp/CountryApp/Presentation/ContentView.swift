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
   
    @State private var username: String = ""
    @State var addedCountries: [Country] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
               
                    ErrorView(error: error) {
                          Task { await viewModel.getAllCountries() }
                      }
                    .onAppear{
                        print("error \(error)")
                    }
                    
                } else {
                    List(viewModel.allCountries) { country in
                        HStack {
                            if let flagURL = country.flags?.png, let url = URL(string: flagURL) {
                                AsyncImage(url: url) { image in
                                    image.resizable().scaledToFit()
                                } placeholder: {
                                    Color.gray.opacity(0.2)
                                }
                                .frame(width: 32, height: 24)
                                .cornerRadius(4)
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
                    .listStyle(PlainListStyle())
                    
                }
            }
            .navigationTitle("Countries")
        }
       
        .task {
            await viewModel.getAllCountries()
        }
    }
}
