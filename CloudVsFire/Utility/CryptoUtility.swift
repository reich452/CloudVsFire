//
//  CryptoUtility.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/27/24.
//

import CryptoKit
import Foundation

enum CryptoUtility {
    
    enum NonceGenerationError: Error {
        case generationFailure(status: OSStatus)
    }
    

    /// Generates a random nonce string of a given length.
    ///
    /// - Parameter length: Length of the nonce, default is 32.
    /// - Returns: A random alphanumeric string with special characters `-`, `.`, and `_`.
    /// - Note: Crashes on failure to generate random bytes.
    static func randomNonceString(length: Int = 32) throws -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            throw NonceGenerationError.generationFailure(status: errorCode)
        }
        
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        return String(nonce)
    }
    
    /// Computes the SHA256 hash of the string.
    ///
    /// - Returns: Hexadecimal string of the SHA256 hash.
    static func sha256(from inputString: String) -> String {
        let inputData = Data(inputString.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        
        return hashString
    }
    
}
