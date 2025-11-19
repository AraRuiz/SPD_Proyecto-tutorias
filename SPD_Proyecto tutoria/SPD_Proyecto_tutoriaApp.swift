import SwiftUI

@main
struct SPD_Proyecto_tutoriaApp: App {
    @StateObject private var vm = ProductsVM()

    var body: some Scene {
        WindowGroup {
            ProductsView()
                .environmentObject(vm)
        }
    }
}
