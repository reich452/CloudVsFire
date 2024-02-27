//
//  User.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/19/24.
//

import Foundation

protocol User {
    var recordID: String { get }
    var name: String { get }
    var email: String { get }
    var profilePicture: String? { get }
}
