//
//  Onboarding.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

struct Onboarding: Identifiable{
    
    let id: UUID
    let title: String
    let subTitle: String
    let imageAsset: ImageAsset
    
    init(id: UUID = UUID(), title: String, subTitle: String, imageAsset: ImageAsset) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.imageAsset = imageAsset
    }
    
}
