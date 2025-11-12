//
//  JSONLoader.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 11/11/25.
//

import Foundation

protocol JSONLoader {
    var url: URL { get }
}

extension JSONLoader {
    
    func load<JSON>(type: JSON.Type) throws -> JSON where JSON: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(JSON.self, from: data)
    }
    
    func save<JSON>(data: JSON) throws where JSON: Codable {
        let data = try JSONEncoder().encode(data)
        try data.write(to: url, options: .atomic)
    }
}
