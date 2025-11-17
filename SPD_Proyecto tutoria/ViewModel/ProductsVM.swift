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
    @Published var favourites = Set<Int>()
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        
        do {
            self.products = try repository.loadCatalog().products
        } catch {
            self.products = []
            print(error)
        }
    }
    
    func isFavourite(id: Int) -> Bool {
        favourites.contains(id)
    }
    
    func updateFavourites(id: Int) {
        if favourites.contains(id) {
            favourites.remove(id)
        } else {
            favourites.insert(id)
        }
    }
    
    
}
