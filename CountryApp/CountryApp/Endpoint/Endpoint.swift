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
    
    struct getAllCountries {
        static var url: String {
            "\(urlBase.urlString)/all?fields=name,flags,capital,cca2"
        }
        static let key = "DeletePaymentMethod"
        static var ttl = 0 // Segundos
    }
    

    
}
    
