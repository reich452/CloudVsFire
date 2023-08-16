//
//  Injected.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

@propertyWrapper
struct Injected<Value> {
    private let keyPath: KeyPath<AppServices, Value>
    
    init(_ keyPath: KeyPath<AppServices, Value>) {
        self.keyPath = keyPath
    }
    
    var wrappedValue: Value {
        AppResolver.resolve(keyPath)
    }
}
