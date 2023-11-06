//
//  ViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 06.11.23.
//

import UIKit
import Security

class KeychainManager {
    func saveCredentials(username: String, password: String) {
        let usernameData = username.data(using: .utf8)!
        let passwordData = password.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: usernameData,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Error saving to keychain")
        }
    }
    
    func validateCredentials(username: String, password: String) -> Bool {
        let usernameData = username.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: usernameData,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &queryResult)
        
        if status == errSecSuccess {
            if let passwordData = queryResult as? Data,
               let retrievedPassword = String(data: passwordData, encoding: .utf8),
               retrievedPassword == password {
                return true
            }
        }
        
        return false
    }
}


