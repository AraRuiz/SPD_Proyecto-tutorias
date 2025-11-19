import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var vm: ProductsVM
    
    var body: some View {
        NavigationStack {
            List(vm.filteredProducts) { product in
                NavigationLink(value: product) {
                    ProductRow(product: product)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            let isFavourite = vm.isFavourite(id: product.id)
                            Button {
                                vm.updateFavourites(id: product.id)
                            } label: {
                                Label(isFavourite ? "Delete" : "Add", systemImage: isFavourite ?  "star.slash" : "star")
                            }
                            .tint(isFavourite ? .gray : .yellow)
                        }
                }
            }
            .navigationTitle("Products")
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
            .searchable(text: $vm.search, prompt: Text("Search by product name"))
            .toolbar {
                ToolbarItem {
                    let onlyFavourites = vm.onlyFavourites
                    Button {
                        vm.onlyFavourites.toggle()
                    } label: {
                        Image(systemName: "star.fill")
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(onlyFavourites ? .yellow : .gray)
                    }
                }
                
                ToolbarItem {
                    Menu {
                        Button {
                            vm.selectedCategory = nil
                        } label: {
                            Text("All")
                            if vm.selectedCategory == nil {
                                Image(systemName: "checkmark")
                            }
                        }

                        ForEach(ProductCategory.allCases) { category in
                            Button {
                                vm.selectedCategory = category
                            } label: {
                                HStack {
                                    Text(category.description)
                                    if vm.selectedCategory == category {
                                        Image(systemName: "checkmark")
                                    }
                                }
                                
                            }
                        }
                    } label: {
                        Label("Categories", systemImage: "tag")
                    }

                }

            }
        }
    }
}

#Preview {
    ProductsView()
        .environmentObject(ProductsVM())
}
