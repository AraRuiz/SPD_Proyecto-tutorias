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
            
            Thumbnail(thumbnail: product.thumbnail)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(product.title)
                    .font(.headline)
                
                ProductTag(tagValue: product.category.rawValue)
                
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
