//
//  CountryListViewModel.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import Foundation
import Combine

class CountryListViewModel: ObservableObject {
    @Published var allCountries: [Country] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var fetchedCountry: Country?
    @Published var isFetchingCountry: Bool = false

    private let countryRepository: CountryRepositoryProtocol
    private var didSetInitialCountry = false
    private var cancellables = Set<AnyCancellable>()
    private let maxCountries = 5
    
    init(countryRepository: CountryRepositoryProtocol) {
        self.countryRepository = countryRepository
    }
    
    @MainActor
    func getAllCountries() async {
        isLoading = true
        self.errorMessage = nil
        do {
            let countries = try await countryRepository.getAllCountries()
            self.allCountries = countries.sorted { $0.name.common < $1.name.common }
        } catch {
            recieveError(error)
            print("Failed fetchCountries() in CountryListViewModel: \(error)")
        }
        isLoading = false
    }
    
    @MainActor
    func getCountryById(id:String) async {
        isFetchingCountry = true
        self.errorMessage = nil
        self.fetchedCountry = nil
        do {
            let country = try await countryRepository.getCountriesById(id: id)
            self.fetchedCountry = country
        } catch {
            recieveError(error)
            print("❌ Failed getCountrieByName() in CountryListViewModel: \(error)")
        }
        isFetchingCountry = false
    }
    
    func recieveError(_ error: Error) {
        if let error = error as? CountryServiceError, error == .badRequest {
            self.errorMessage = error.errorDescription ?? "Error Message: Bad Request"
        }
        else if let error = error as? CountryServiceError, error == .unauthorized {
            self.errorMessage = error.errorDescription ?? "Error Message: Unauthorized"
        }
        else if let error  = error as? CountryServiceError, error == .notToken {
            self.errorMessage = error.errorDescription ?? "Error Message: Not Token"
        }
    }
    
}
