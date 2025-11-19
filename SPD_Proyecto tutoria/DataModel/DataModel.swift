//
//  Product.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 10/11/25.
//

import Foundation

struct Catalog: Codable {
    let products: [Product]
}

struct Product: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: ProductCategory
    let images: [String]
    let thumbnail: String
    
    var priceFormatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}

enum ProductCategory: String, Codable, CaseIterable, Identifiable, CustomStringConvertible {
    var id: String { rawValue }
    
    case beauty
    case fragrances
    case furniture
    case groceries
    case laptops
    case homeDecoration = "home-decoration"
    case kitchenAccessories = "kitchen-accessories"
    case mensShirts = "mens-shirts"
    case mensShoes = "mens-shoes"
    case mensWatches = "mens-watches"
    case mobileAccessories = "mobile-accessories"
    
    var description: String {
        switch self {
        case .beauty:
            "Beauty"
        case .fragrances:
            "Fragances"
        case .furniture:
            "Furniture"
        case .groceries:
            "Groceries"
        case .laptops:
            "Laptops"
        case .homeDecoration:
            "Home Decoration"
        case .kitchenAccessories:
            "Kitchen Accessories"
        case .mensShirts:
            "Mens Shirts"
        case .mensShoes:
            "Mens Shoes"
        case .mensWatches:
            "Mens Watches"
        case .mobileAccessories:
            "Mobile Accessories"
        }
    }
}

extension Product {
    static let test = Product(id: 1,
                              title: "Essence Mascara Lash Princess",
                              price: 9.99,
                              description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                              category: .beauty,
                              images: [
                                "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
                              ],
                              thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp")
}
