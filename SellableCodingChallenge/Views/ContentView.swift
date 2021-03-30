//
//  ContentView.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import SwiftUI

struct AlbumView: View {
    @ObservedObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.albumVM) { album in
                    HStack(spacing: 10) {
                        Text("\(album.albumName)")
                        Text("\(album.artist)")
                    }
                }
            }
            .navigationBarTitle("Albums")
            .onAppear(perform: {
                viewModel.getAlbum { (_) in }
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
