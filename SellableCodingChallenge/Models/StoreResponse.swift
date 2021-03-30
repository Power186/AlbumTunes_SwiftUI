//
//  StoreResponse.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import Foundation

struct StoreResponse: Codable {
    let results: [StoreItem]
}

struct Feed: Codable {
    let feed: StoreResponse
}
