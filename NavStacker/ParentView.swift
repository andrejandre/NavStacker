//
//  ParentView.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/3/22.
//

import SwiftUI

enum ProductViews: Hashable {
    case allKombuchas([Kombucha])
    case allCoffees([Coffee])
}

enum DrinkProductViews: Hashable {
    case kombucha(Kombucha)
    case coffee(Coffee)
}

struct ParentView: View {
    
    @StateObject var drinkProductViewModel = DrinkProductViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack(path: self.$drinkProductViewModel.navPath) {
                List {
                    Section("Products") {
                        NavigationLink(value: ProductViews.allKombuchas(self.drinkProductViewModel.kombuchaProducts)) {
                            HStack {
                                Text("Kombuchas")
                                Spacer()
                                Image(systemName: "list.bullet")
                            }
                        }
                        NavigationLink(value: ProductViews.allCoffees(self.drinkProductViewModel.coffeeProducts)) {
                            HStack {
                                Text("Coffees")
                                Spacer()
                                Image(systemName: "list.bullet")
                            }
                        }
                    }
                }
                .navigationDestination(for: ProductViews.self) { productView in
                    switch productView {
                    case .allKombuchas(_):
                        KombuchaProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    case .allCoffees(_):
                        CoffeeProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    }
                }
            }
        }
    }
}
