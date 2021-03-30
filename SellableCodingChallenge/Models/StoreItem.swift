//
//  StoreItem.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import Foundation

struct StoreItem: Codable {
    let artist: String?
    let albumName: String?
    var artworkURL: String?
    var releaseDate: String?
    var copyright: String?
    var genres: [Genre]?
    var albumUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case albumName = "name"
        case artworkURL = "artworkUrl100"
        case releaseDate
        case copyright
        case genres
        case albumUrl = "url"
    }
}
