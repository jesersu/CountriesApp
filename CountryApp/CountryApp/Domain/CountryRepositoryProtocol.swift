//
//  CountryRepositoryProtocol.swift
//  RESTCountries
//
//  Created by Amr Salman on 22/07/2025.
//

import Foundation

protocol CountryRepositoryProtocol {
    func getAllCountries() async throws -> [Country]
}
