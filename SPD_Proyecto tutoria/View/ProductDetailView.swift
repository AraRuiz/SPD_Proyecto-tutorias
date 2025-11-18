//
//  ProductDetailView.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 17/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .background(.quinary.opacity(0.2))
            } placeholder: {
                Image(systemName: "photo.fill")
            }
            
            HStack {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Text(product.priceFormatted)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                CategoryChip(tagValue: product.category.rawValue)
                Spacer()
            }
            
            Text(product.description)
                .fontWeight(.light)
            
            Button {
                print("Add to cart")
            } label: {
                Text("Add to cart " )
            }
            .padding(8)
            .background(.black)
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .clipShape(.rect(cornerRadius: 12))
        }
        .padding()
        
        
        
        
        
        
    }
    
}

#Preview {
    ProductDetailView(product: Product.test)
}
