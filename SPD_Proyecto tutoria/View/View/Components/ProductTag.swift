//
//  ProductTag.swift
//  SPD_Proyecto tutoria
//
//  Created by Ara Ruiz Ruiz on 12/11/25.
//

import SwiftUI

struct ProductTag: View {
    let tagValue: String
    
    var body: some View {
        Text(tagValue.capitalized)
            .font(.caption)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(.quinary.opacity(0.2))
            .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    ProductTag(tagValue: Product.test.category.rawValue)
}
