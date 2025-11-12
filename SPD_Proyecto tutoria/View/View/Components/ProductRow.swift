//
//  ProductRow.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .background(.quinary.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 12))
            } placeholder: {
                Image(systemName: "photo.fill")
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(product.title)
                    .font(.headline)
                Text(product.category.rawValue.capitalized)
                    .font(.caption)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(.quinary.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 12))
                
                Text(product.description)
                    .font(.subheadline)
                    .lineLimit(4)
                
                Text(product.priceFormatted)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
        }

    }
}

#Preview {
    ProductRow(product: Product.test)
        .padding()
}
