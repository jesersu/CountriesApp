//
//  SerachView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 21/08/25.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var onSearch: (String) -> Void
    
    var body: some View {
        TextField("Search country...", text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .onChange(of: searchText) {
                    onSearch(searchText)
            }
    }
}
