//
//  CountryRow.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 21/08/25.
//
import SwiftUI

struct CountryRow: View {
    let country: Country
    @ObservedObject var viewModel: CountryListViewModel

    var body: some View {
        
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
         
            Button(action: {
                viewModel.toggleFavorite(for: country)
            }) {
                Image(systemName: viewModel.isFavorite(country) ? "star.fill" : "star")
                    .foregroundColor(viewModel.isFavorite(country) ? .yellow : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        
   
    }
}
