//
//  NetworkManager.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let imageCache = NSCache<NSString, NSData>()
    
    private let baseUrlString = "https://rss.itunes.apple.com/api/v1/"
    private let USTopAlbums = "us/itunes-music/top-songs/all/100/explicit.json"
    
    func fetchAlbums(completion: @escaping (Result<[StoreItem], Error>) -> Void) {
        let urlString = "\(baseUrlString)\(USTopAlbums)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let storeItems = try JSONDecoder().decode(Feed.self, from: data)
                    completion(.success(storeItems.feed.results))
                } catch {
                    completion(.failure(error))
                }
            } else {
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(.success(cachedImage as Data))
        } else {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
                if let data = data {
                    self?.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                    completion(.success(data))
                } else {
                    if let error = error {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
    
}
