//
//  ProductRow.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    @EnvironmentObject var vm: ProductsVM

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            ZStack(alignment: .topLeading) {
                Thumbnail(thumbnail: product.thumbnail)
                
                if vm.isFavourite(id: product.id) {
                    Image(systemName: "star.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .white)
                        .offset(x: -8, y: -8)
                }
                
            }
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text(product.title)
                    .font(.headline)
                
                CategoryChip(tagValue: product.category.rawValue)
                
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
        .environmentObject(ProductsVM(repository: RepositoryTest()))
}
