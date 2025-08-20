//
//  SettingEndpoint.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 20/08/25.
//
import Persist
struct SettingEndpoint {
    enum UrlType: String {
        case preProduction, production

        var urlString: String {
            switch self {
            case .preProduction:
                return "https://restcountries.com/v3/"
            case .production:
                return "https://restcountries.com/v3.1/"
            }
        }
    }

    static func getUrl() -> UrlType {
        let urlSaved = Persist.getCacheData(key: KeysCache.environmentType)
        //let urlSaved = KeychainManager.retrieveAttribute(key: KeysCache.environmentType)

        switch urlSaved {
        case UrlType.preProduction.rawValue:
            return UrlType.preProduction
        case UrlType.production.rawValue:
            return UrlType.production
        default:
            return UrlType.production
        }
    }
    
}
