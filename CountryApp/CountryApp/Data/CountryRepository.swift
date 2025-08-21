//
//  CountryRepository.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import Foundation

class CountryRepository: CountryRepositoryProtocol {

    private let service: CountryService

    init(service: CountryService = CountryService()) {
        self.service = service
    }
    
    /// Retrieve all countries
    /// - Returns: Countries array
    func getAllCountries() async throws -> [Country] {
        let remote = try await service.fetchAllCountries()
        print("Fetched \(remote.count) countries from remote service.")
        return remote
    }
    
    /// Get countries by id
    /// - Parameter id: country id to search for
    /// - Returns: Countries a
    func getCountriesById(id: String) async throws -> Country {
        let remote = try await service.getCountryById(id: id)
        print("Fetched \(remote) countries from remote service for name: \(id).")
        return remote
    }
    
    func getCountriesByName(name: String) async throws -> [Country] {
        let remote = try await service.getCountryByName(name: name)
        print("Fetched \(remote) countries from remote service for name: \(name).")
        return remote
    }
    
    
}
