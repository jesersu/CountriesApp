//
//  CountryListViewModel.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import Foundation
import Combine

class CountryListViewModel: ObservableObject {
    private let countryRepository: CountryRepositoryProtocol

    init(countryRepository: CountryRepositoryProtocol) {
        self.countryRepository = countryRepository
    }
    
    @MainActor
    func getAllCountries() async {
        do {
            let countries = try await countryRepository.getAllCountries()
        } catch {
            print("Failed fetchCountries() in CountryListViewModel: \(error)")
        }
    }
    
}
