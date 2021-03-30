//
//  AlbumCell.swift
//  SellableCodingChallenge
//
//  Created by Scott on 3/30/21.
//

import SwiftUI

struct AlbumCell: View {
    @ObservedObject var albumListVM = AlbumListViewModel()
    let viewModel: AlbumViewModel
    
    var body: some View {
        HStack {
            imageView
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.albumName)
                    .font(.caption)
                    .bold()
                
                Text(viewModel.artist)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
        }
        .onAppear(perform: {
            albumListVM.fetchImage(with: viewModel)
        })
    }
    
    private var imageView: some View {
        albumListVM.image
            .resizable()
            .frame(width: 70, height: 70)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5)
    }
    
}

//struct AlbumCell_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumCell()
//    }
//}
