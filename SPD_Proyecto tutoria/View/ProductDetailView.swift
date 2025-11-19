//
//  ProductDetailView.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 17/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var vm: ProductsVM
    
    var body: some View {
        VStack(spacing: 16) {
            
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.quinary.opacity(0.2))
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                
                let isFavourite = vm.isFavourite(id: product.id)
                Button {
                    vm.updateFavourites(id: product.id)
                } label: {
                    Image(systemName: "star.fill")
                        .font(.title)
                }
                .offset(x: -8, y: 8)
                .tint(isFavourite ? .yellow : .gray)
                    
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
            
            Spacer()
            
            Button {
                print("Add to cart")
            } label: {
                Text("Add to cart")
                    .frame(maxWidth: .infinity) // Esto garantiza que el texto rellene el botón
            }
            .padding(.vertical, 16)
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
        .environmentObject(ProductsVM(repository: RepositoryTest()))
}
