//
//  CountryDetailView.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 16) {
                    if let flagURL = country.flags?.png, let url = URL(string: flagURL), UIApplication.shared.canOpenURL(url) {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 120, height: 80)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(country.name.common)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                        Text(country.name.official)
                            .font(.caption)
                            .fontWeight(.light)
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                    }
                }
                
                Divider()
                
                HStack{
                    VStack(alignment: .leading, spacing: 16){
                        detailRow(label: "Coat of Arms", value: country.subregion, isImage: true)
                        detailRow(label: "Region", value: country.region)
                        detailRow(label: "Subregion", value: country.subregion)
                        detailRow(label: "Capital", value: country.capital?.first)
                        detailRow(label: "Area", value: country.area.map { "\($0) km²" })
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        detailRow(label: "Population", value: country.population.map { "\($0)" })
                        detailRow(label: "Languages", value: country.languages?.map { $0.value }.joined(separator: ", "))
                        detailRow(label: "Car Drive side", value: country.car?.side)
                        detailRow(label: "Concurrencies", value: country.currencies?.keys.joined(separator: ", "))
                        detailRow(label: "Timezones", value: country.timezones?.joined(separator: ", "))
                    }
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func detailRow(label: String, value: String?, isImage : Bool = false) -> some View {
        if let value = value, !value.isEmpty {
            VStack (alignment: .leading, spacing: 4) {
                Text(label)
                    .font(.headline)
                    .fontWeight(.semibold)
                if isImage{
                    if let flagURL = country.coatOfArms?.png, let url = URL(string: flagURL), UIApplication.shared.canOpenURL(url) {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 30, height: 30)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    }
                }else{
                    Text(value)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
