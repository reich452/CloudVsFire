//
//  Container.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

class Container {
    
    /// Dictionary to hold factory closures for services that should be created new every time they are requested.
    private var factories: [ObjectIdentifier: () -> Any] = [:]
    
    /// Dictionary to hold instances of services that should only be created once and then reused.
    private var singletons: [ObjectIdentifier: Any] = [:]
    
    /// Registers a transient service with a factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The type of the service to register.
    ///   - factory: A closure that returns an instance of `serviceType`.
    func register<Service>(_ serviceType: Service.Type, factory: @escaping () -> Service) {
        let key = ObjectIdentifier(serviceType)
        factories[key] = factory
    }
    
    /// Registers a singleton service with a factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The type of the service to register.
    ///   - factory: A closure that returns an instance of `serviceType`.
    ///              This instance will be reused for all subsequent requests for this service type.
    func registerSingleton<Service>(_ serviceType: Service.Type, factory: @escaping () -> Service) {
        let key = ObjectIdentifier(serviceType)
        singletons[key] = factory()
    }
    
    /// Resolves and returns an instance of the requested service type.
    ///
    /// - Parameter serviceType: The type of service to resolve.
    /// - Returns: An instance of the requested service type, or `nil` if no matching service is registered.
    ///
    /// This method first checks if a singleton instance of the service is already created,
    /// and if so, returns that. If not, it creates and returns a new instance using the associated factory closure.
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        let key = ObjectIdentifier(serviceType)
        
        if let singleton = singletons[key] as? Service {
            return singleton
        }
        
        return (factories[key] as? () -> Service)?()
    }
}
