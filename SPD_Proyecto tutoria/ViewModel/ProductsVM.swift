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
    @Published var selectedCategory: ProductCategory? = nil
    
    var filteredProducts: [Product] {
        products
            .filter { !onlyFavourites || favourites.contains($0.id) }
            .filter { selectedCategory == nil || $0.category == selectedCategory }
            .filter { search.isEmpty || $0.title.range(of: search, options: [.caseInsensitive, .diacriticInsensitive]) != nil }
    }
    
    var categoryProducts: [Product] {
        products.filter {
            $0.category == selectedCategory
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
