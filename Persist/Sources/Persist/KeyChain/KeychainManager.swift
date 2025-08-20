//
//  KeychainManager.swift
//  Persist
//
//  Created by Jesús Ervin Chapi Suyo on 20/08/25.
//

import Security
import Foundation

public class KeychainManager {
    public static func saveAttribute(key: String, value: String) {
        guard let valueData = value.data(using: .utf8) else { return }
        // Set attributes
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: valueData,
        ]

        // Add user
        let status = SecItemAdd(attributes as CFDictionary, nil)
        if status == noErr {
            print("\(self) value saved keychain status: ", status)
        } else {
            print("\(self) couldn't save value keychain status: ", status)
        }
    }
    
    public static func retrieveAttribute(key: String) -> String? {
        var storedValue: String?

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        if status == noErr {
            if let existingItem = item as? [String: Any],
               let key = existingItem[kSecAttrAccount as String] as? String,
               let valueData = existingItem[kSecValueData as String] as? Data,
               let value = String(data: valueData, encoding: .utf8) {
                print("\(self) retrieved value for key: ", key)
                storedValue = value
            }
        } else {
            print("\(self) value not found status: ", status)
        }
        
        return storedValue
    }
    
    public static func modifyAttribute(key: String, value: String) {
        guard let valueData = value.data(using: .utf8) else { return }
        print("\(self) modifyAttribute: ", key)

        // Set query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
        ]

        // Set attributes for the new value
        let attributes: [String: Any] = [kSecValueData as String: valueData]

        // Find user and update
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if status == noErr {
            print("\(self) value changed status: ", status)
        } else {
            print("\(self) Couldn't modify value status: ", status)
        }
    }
}
