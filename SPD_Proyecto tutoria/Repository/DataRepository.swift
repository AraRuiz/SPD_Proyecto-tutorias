//
//  DataRepository.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 11/11/25.
//

import Foundation

protocol DataRepository: JSONLoader {
    func loadCatalog() throws -> Catalog
    func saveCatalog(_ catalog: Catalog) throws
}

extension DataRepository {
    
    func loadCatalog() throws -> Catalog {
        try load(type: Catalog.self)
    }
    
    func saveCatalog(_ catalog: Catalog) throws {
        try save(data: catalog)
    }
}



