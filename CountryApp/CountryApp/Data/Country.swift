//
//  Country.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//

import Foundation

struct Country: Codable, Identifiable, Equatable {
    //Creamos los campos necesarios de a cuerdo al PDF de ejemplo
    let id: String
    let cca2: String
    let name: Name
    let flags: Flag?
    let coatOfArms: String?
    let region: String?
    let subregion: String?
    let capital: [String]?
    let area: Double?
    let population: Int?
    let languages: [String: String]?
    let car: Car?;
    let currencies: [String: Currency]?
    let timezones: [String]?
    
    struct Name: Codable, Equatable {
        let common: String
        let official: String
    }
    
    struct Flag: Codable, Equatable {
        let png: String?
        let svg: String?
        let alt: String?
    }
    
    struct CoatOfArms: Codable, Equatable {
        let png: String?
        let svg: String?
    }
    
    struct Car: Codable, Equatable {
        let signs: [String]?
        let side: String?
    }
    
    struct Currency: Codable, Equatable {
        let name: String?
        let symbol: String?
    }
    
    enum CodingKeys: String, CodingKey {
        case name, cca2, flags, coatOfArms, region, subregion, capital, area, population, languages, car ,currencies, timezones
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(Name.self, forKey: .name)
        self.flags = try? container.decode(Flag.self, forKey: .flags)
        self.coatOfArms = try? container.decode(String.self, forKey: .coatOfArms)
        self.region = try? container.decode(String.self, forKey: .region)
        self.subregion = try? container.decode(String.self, forKey: .subregion)
        self.capital = try? container.decode([String].self, forKey: .capital)
        self.area = try? container.decode(Double.self, forKey: .area)
        self.population = try? container.decode(Int.self, forKey: .population)
        self.languages = try? container.decode([String: String].self, forKey: .languages)
        self.car = try? container.decode(Car.self, forKey: .car)
        self.currencies = try? container.decode([String: Currency].self, forKey: .currencies)
        self.timezones = try? container.decode([String].self, forKey: .timezones)
        self.cca2 = try container.decode(String.self, forKey: .cca2)
        self.id = self.cca2
    }
    
    init(id: String, cca2: String, name: Name, flags: Flag?, coatOfArms: String?, region: String?, subregion: String?, capital: [String]?, area: Double?, population: Int?, languages: [String: String]?, car: Car?, currencies: [String: Currency]?, timezones: [String]?) {
        self.id = id
        self.cca2 = cca2
        self.name = name
        self.flags = flags
        self.coatOfArms = coatOfArms
        self.region = region
        self.subregion = subregion
        self.capital = capital
        self.area = area
        self.population = population
        self.currencies = currencies
        self.languages = languages
        self.car = car
        self.timezones = timezones
    }
    
}
