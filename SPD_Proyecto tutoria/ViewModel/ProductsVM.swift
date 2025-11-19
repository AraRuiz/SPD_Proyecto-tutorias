//
//  ProductsVM.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import Foundation
import Combine

final class ProductsVM: ObservableObject {
    private let repository: DataRepository

    @Published private(set) var products: [Product]
    @Published var favourites = Set<Int>()
    @Published var search = ""
    @Published var onlyFavourites = false
    
    var filteredProducts: [Product] {
        var filteredProducts = products
        if onlyFavourites {
            filteredProducts = favouritesProducts
        }
        
        return filteredProducts.filter {
            search.isEmpty || $0.title.range(of: search, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }
    }
    
    var favouritesProducts: [Product] {
        products.filter {
            isFavourite(id: $0.id)
        }
    }
    
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
