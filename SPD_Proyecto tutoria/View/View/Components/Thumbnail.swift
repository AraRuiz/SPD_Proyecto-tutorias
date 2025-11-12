//
//  Thumbnail.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import SwiftUI

struct Thumbnail: View {
    let thumbnail: String
    
    var body: some View {
        AsyncImage(url: URL(string: thumbnail)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .background(.quinary.opacity(0.2))
                .clipShape(.rect(cornerRadius: 12))
        } placeholder: {
            Image(systemName: "photo.fill")
        }
    }
}

#Preview {
    Thumbnail(thumbnail: Product.test.thumbnail)
}
