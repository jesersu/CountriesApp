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
        let (data, response) = try await URLSession.shared.data(from: url)
       
        if let httResponse = response as? HTTPURLResponse {
            let statusCode = httResponse.statusCode
            
            switch statusCode {
                case 200...299:
                    break;
            default:
                let errorFinded = parseError(data: data, statusCode: statusCode)
                throw errorFinded
            }
        }
        throw CountryServiceError.badRequest
        //return try JSONDecoder().decode([Country].self, from: data)
    }
    
    private func parseError(data: Data, statusCode: Int) -> CountryServiceError {
        if statusCode == 401 {
            return .notToken
        } else if statusCode == 403 {
            return CountryServiceError.unauthorized
        } else {
            return CountryServiceError.badRequest
        }
    }
}

enum CountryServiceError: String, Error {
    case notToken = "401 not token"
    case unauthorized = "403 sin opermiso"
    case badRequest = "404 bad request"
}

extension CountryServiceError: LocalizedError {
     public var errorDescription: String? {
        switch self {
        case .notToken:
            return "bad Token"
        case .unauthorized:
            return "Without Permission"
        case .badRequest:
            return "Bad Request"
        }
    }
}
