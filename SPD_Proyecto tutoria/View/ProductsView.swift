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
                NavigationLink(value: product) {
                    ProductRow(product: product)
                }
                
            }
            .navigationTitle("Products")
            .navigationDestination(for: Product.self) { product in
                
            }
        }
    }
}

#Preview {
    ProductsView()
}
