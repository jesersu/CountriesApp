//
//  MainView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 21/08/25.
//

import SwiftUI
struct MainView: View {
    @StateObject var viewModel = CountryListViewModel(countryRepository: CountryRepository())

    var body: some View {
        TabView {
            CountryView(viewModel: viewModel)
                .tabItem {
                    Label("Countries", systemImage: "globe")
                }

            FavoritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}
