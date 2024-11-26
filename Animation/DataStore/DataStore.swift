//
//  DataStore.swift
//  Animation
//
//  Created by Perejro on 27/11/2024.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    private init() {}
    
    func getAnimation() -> Animation {
        Animation.make()
    }
}
