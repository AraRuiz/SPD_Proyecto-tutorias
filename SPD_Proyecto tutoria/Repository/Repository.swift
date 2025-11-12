//
//  Repository.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 11/11/25.
//

import Foundation

struct Repository: DataRepository {

    var url: URL {
        Bundle.main.url(forResource: "products_100", withExtension: "json")!
    }

}

struct RepositoryTest: DataRepository {
    
    var url: URL {
        Bundle.main.url(forResource: "products_test", withExtension: "json")!
    }
    
    func save(products: [Product]) throws {
        print("Se ha intentado guardar el catalogo")
    }
    
    
}
