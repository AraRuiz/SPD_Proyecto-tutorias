//
//  ProductsView.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 10/11/25.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var vm = ProductsVM()
    
    var body: some View {
        NavigationStack {
            List(vm.products) { product in
                ProductRow(product: product)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        let isFavourite = vm.isFavourite(id: product.id)
                        Button {
                            vm.updateFavourites(id: product.id)
                        } label: {
                            Label(isFavourite ? "Delete" : "Add", systemImage: isFavourite ?  "star.slash" : "star")
                            
                        }
                        .tint(isFavourite ? .gray : .yellow)

                    }
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ProductsView()
}
