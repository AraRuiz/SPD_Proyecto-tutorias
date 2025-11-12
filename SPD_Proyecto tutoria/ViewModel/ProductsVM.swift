//
//  ProductsVM.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import Combine

final class ProductsVM: ObservableObject {
    @Published private(set) var products: [Product]
    private let repository: DataRepository
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        
        do {
            self.products = try repository.loadCatalog().products
        } catch {
            self.products = []
            print(error)
        }
    }
    
}
