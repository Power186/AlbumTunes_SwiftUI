//
//  AlbumListViewModel.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import SwiftUI

final class AlbumListViewModel: ObservableObject {
    static let shared = AlbumListViewModel()
    
    @Published var albumVM = [AlbumViewModel]()
    @Published var image = Image(systemName: "photo")
    
    func fetchImage(with viewModel: AlbumViewModel) {
        NetworkManager.shared.fetchImage(urlString: viewModel.artworkUrl) { [weak self] (result) in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    guard let inputImage = UIImage(data: imageData) else { return }
                    self?.image = Image(uiImage: inputImage)
                }
            case .failure(let error):
                self?.displayError(error, title: "Failed to fetch image.")
            }
        }
    }
    
    func getAlbum(completion: @escaping ([AlbumViewModel]) -> Void) {
        NetworkManager.shared.fetchAlbums { [weak self] (result) in
            switch result {
            case .success(let items):
                let albumVM = items.map(AlbumViewModel.init)
                DispatchQueue.main.async {
                    self?.albumVM = albumVM
                    completion(albumVM)
                }
            case .failure(let error):
                self?.displayError(error, title: "Failed to load albums")
            }
        }
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title,
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss",
                                              style: .default,
                                              handler: nil))
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
}
