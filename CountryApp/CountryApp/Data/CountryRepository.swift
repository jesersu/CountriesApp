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
    
    func getAllCountries() async throws -> [Country] {
        let remote = try await service.fetchAllCountries()
        print("Fetched \(remote.count) countries from remote service.")
        return remote
    }
}
