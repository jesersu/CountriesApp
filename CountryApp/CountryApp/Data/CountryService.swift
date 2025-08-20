//
//  CountryService.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import Foundation

class CountryService {
    
    private let url = URL(string: Endpoint.getAllCountriesURL.url)!
    
    func fetchAllCountries() async throws -> [Country] {
        print("url : \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
} 
