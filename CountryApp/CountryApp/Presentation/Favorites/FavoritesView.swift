//
//  FavoritesView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 21/08/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: CountryListViewModel

    var body: some View {
        NavigationStack {
            if viewModel.favorites.isEmpty {
                Text("No favorites yet ⭐")
                    .foregroundColor(.gray)
                    .italic()
                    .padding()
            } else {
                List(viewModel.favorites) { country in
                    NavigationLink(value: country) {
                        CountryRow(country: country, viewModel: viewModel)
                    }
                }
                .navigationDestination(for: Country.self) { country in
                    CountryDetailView(country: country)
                }
            }
           
        } .navigationTitle("Favorites")
    }
}
