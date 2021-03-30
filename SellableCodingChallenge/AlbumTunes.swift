//
//  SellableCodingChallengeApp.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import SwiftUI

@main
struct SellableCodingChallengeApp: App {
    
    init() {
            let temporaryDirectory = NSTemporaryDirectory()
                    let urlCache = URLCache(memoryCapacity: 250_000_000, diskCapacity: 300_000_000, diskPath: temporaryDirectory)
                    URLCache.shared = urlCache
        }
    
    var body: some Scene {
        WindowGroup {
            AlbumView()
        }
    }
}
