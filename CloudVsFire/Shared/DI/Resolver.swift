//
//  Resolver.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

protocol Resolver {
    func resolve<Service>(_ serviceType: Service.Type) -> Service?
}
