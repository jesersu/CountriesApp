// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
public struct Persist {
    /// Trae data de cache
    ///
    /// - Parameter key: llave de la data
    /// - Returns: data en formato string
    public static func getCacheData(key: String) -> String {
        let preferences = UserDefaults.standard
        if preferences.string(forKey: key) != nil {
            let value = preferences.string(forKey: key)
            return value!
        } else {
            return ""
        }
    }
    
    /// Guarda data en cache
    ///
    /// - Parameters:
    ///   - value: valor
    ///   - key: llave
    public static func saveCache(key: String, value: String) {
        let preferences = UserDefaults.standard
//        Logger.log("saveCache() key:\(key) value:\(value)")
        preferences.set(value, forKey: key)
        didSaveCache(preferences: preferences)
    }

    /// Verifica si se guardo dato
    ///
    /// - Parameter preferences: dato a verificar
    public static func didSaveCache(preferences: UserDefaults) {
        let didSave = preferences.synchronize()
        if !didSave {
//            Logger.log("No se pudo guardar cache!")
        }
    }
}
