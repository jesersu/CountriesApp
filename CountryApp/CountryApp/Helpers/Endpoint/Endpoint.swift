//
//  Endpoint.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//
import Persist
struct Endpoint {
    //Para elegir ambientes
    static var urlBase: SettingEndpoint.UrlType {
        return SettingEndpoint.getUrl()
    }
    
    struct getAllCountriesURL {
        static var url: String {
            "\(urlBase.urlString)/all?fields=name,flags,capital,cca2"
        }
        static let key = "getAllCountries"
        static var ttl = 0
    }
    
    struct getCountriesByIdURL {
        static var url: String {
            "\(urlBase.urlString)/alpha/{name}?fields=name,flags,coatOfArms,region,subregion,capital,area,population,languages,car,currencies,timezones,cca2"
        }
        static let key = "getCountriesById"
        static var ttl = 0
    }

    
}
    
